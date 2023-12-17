//
//  GoogleAppleSignInButtons.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/08/23.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct GoogleAppleSignInButtons: View {
  @EnvironmentObject var authViewModel: AuthenticationViewModel
  @State var currentNonce: String?

    var body: some View {
      VStack {
        HStack {
          VStack {
            Divider()
              .background(.white)
              .frame(width: 90)
          }
          
          Text("Ou entre com")
            .foregroundColor(.white)
            .font(.custom("Barlow-Regular", size: 14))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.horizontal, 10)
          
          VStack {
            Divider()
              .background(.white)
              .frame(width: 90)
          }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        
        VStack(alignment: .center, spacing: 20) {
          Spacer()
          
          Button {
            authViewModel.googleSignIn()
          } label: {
            GoogleSignInButton()
          }
          .frame(width: 50, height: 50)
          .padding(.trailing, 70)
          
          SignInWithAppleButton(
            onRequest: { request in
              authViewModel.setRequestNonce(request: request)
            },
            onCompletion: { result in
              authViewModel.executeAppleSignIn(result: result)
            }
          )
          .frame(width: 50, height: 50)
          
//          Button {
//            // Sign in with Apple
//          } label: {
//            VStack(spacing: 8) {
//              Image("AppleButton")
//                .resizable()
//                .frame(width: 50, height: 50)
//              
//              Text("Apple")
//                .foregroundColor(.white)
//                .font(.custom("Barlow-Bold", size: 16))
//            }
//          }
          
          Spacer()
        }
      }
    }
}

struct GoogleAppleSignInButtons_Previews: PreviewProvider {
  static let authViewModel = AuthenticationViewModel()
    static var previews: some View {
      GoogleAppleSignInButtons()
        .environmentObject(authViewModel)
    }
}
