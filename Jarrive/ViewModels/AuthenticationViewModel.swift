//
//  AuthenticationViewModel.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import Foundation
import Firebase
import GoogleSignIn
import CryptoKit
import AuthenticationServices

class AuthenticationViewModel: ObservableObject {
  enum SignInState {
    case signedIn
    case signedOut
  }

  @Published var authState: SignInState = .signedOut
  @Published var isLogging: Bool = false
  @Published var currentNonce: String?
  
  // MARK: Sign in with Google

  func checkIfSignedInGoogle() {
    if GIDSignIn.sharedInstance.hasPreviousSignIn() {
      GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
        isLogging = true
        authenticateUser(for: user, with: error)
      }
    }
  }
  
  func googleSignIn() {
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }
      
      let configuration = GIDConfiguration(clientID: clientID)
      GIDSignIn.sharedInstance.configuration = configuration
      
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
      guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
      
      GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] user, error in
        guard let gidUser = user?.user else { return }
        isLogging = true
        authenticateUser(for: gidUser, with: error)
      }
  }
  
  private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
    if let error = error {
      print(error.localizedDescription)
      isLogging = false
      return
    }
    
    guard let gidUser = user, let idToken = gidUser.idToken  else { return }
    let accessToken = gidUser.accessToken
    
    let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
    
    Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
      if let error = error {
        print(error.localizedDescription)
        isLogging = false
      } else {
        self.authState = .signedIn
        isLogging = false
      }
    }
  }

  func signOut() {
    GIDSignIn.sharedInstance.signOut()
    
    do {
      try Auth.auth().signOut()
      self.authState = .signedOut
    } catch {
      print(error.localizedDescription)
    }
  }
  
  // MARK: Sign in With Apple

  func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    var randomBytes = [UInt8](repeating: 0, count: length)
    let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
    if errorCode != errSecSuccess {
      fatalError(
        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
      )
    }

    let charset =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

    let nonce = randomBytes.map { byte in
      // Pick a random character from the set, wrapping around if needed.
      charset[Int(byte) % charset.count]
    }

    return String(nonce)
  }

  @available(iOS 13, *)
  func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
      String(format: "%02x", $0)
    }.joined()

    return hashString
  }
  
  func setRequestNonce(request: ASAuthorizationAppleIDRequest) {
    let nonce = randomNonceString()
    currentNonce = nonce
    request.requestedScopes = [.fullName, .email]
    request.nonce = sha256(nonce)
  }
  
  func executeAppleSignIn(result: Result<ASAuthorization, Error>) {
    isLogging = true
    switch result {
      case .success(let authResults):
          switch authResults.credential {
          case let appleIDCredential as ASAuthorizationAppleIDCredential:
              
              guard let nonce = currentNonce else {
                  isLogging = false
                  fatalError("Invalid state: A login callback was received, but no login request was sent.")
              }
              guard let appleIDToken = appleIDCredential.identityToken else {
                  isLogging = false
                  fatalError("Invalid state: A login callback was received, but no login request was sent.")
              }
              guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                  isLogging = false
                  print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                  return
              }
              
              let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
              Auth.auth().signIn(with: credential) { (authResult, error) in
                  if (error != nil) {
                      // Error. If error.code == .MissingOrInvalidNonce, make sure
                      // you're sending the SHA256-hashed nonce as a hex string with
                      // your request to Apple.
                      self.isLogging = false
                      print(error?.localizedDescription as Any)
                      return
                  }
                  print("signed in")
                  self.authState = .signedIn
                  self.isLogging = false
              }
              
              print("\(String(describing: Auth.auth().currentUser?.uid))")
          default:
              break
          }
      default:
          break
      }
  }
}
