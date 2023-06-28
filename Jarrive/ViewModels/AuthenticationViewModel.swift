//
//  AuthenticationViewModel.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {
  enum SignInState {
    case signedIn
    case signedOut
  }

  @Published var authState: SignInState = .signedOut
  
  func signIn() {
    if GIDSignIn.sharedInstance.hasPreviousSignIn() {
      GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
          authenticateUser(for: user, with: error)
      }
    } else {
      guard let clientID = FirebaseApp.app()?.options.clientID else { return }
      
      let configuration = GIDConfiguration(clientID: clientID)
      GIDSignIn.sharedInstance.configuration = configuration
      
      guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
      guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
      
      GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] user, error in
        guard let gidUser = user?.user else { return }
        authenticateUser(for: gidUser, with: error)
      }
    }
  }
  
  private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
    if let error = error {
      print(error.localizedDescription)
      return
    }
    
    guard let gidUser = user, let idToken = gidUser.idToken  else { return }
    let accessToken = gidUser.accessToken
    
    let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
    
    Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
      if let error = error {
        print(error.localizedDescription)
      } else {
        self.authState = .signedIn
      }
    }
  }

  func signOut() {
    GIDSignIn.sharedInstance.signOut()
    
    do {
      try Auth.auth().signOut()
      
      authState = .signedOut
    } catch {
      print(error.localizedDescription)
    }
  }

}
