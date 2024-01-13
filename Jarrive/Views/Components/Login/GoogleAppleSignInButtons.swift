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
            .minimumScaleFactor(0.5)
            .font(.custom("Barlow-Regular", size: 14))
            .lineLimit(1)
            .padding(.horizontal, 10)
          
          VStack {
            Divider()
              .background(.white)
              .frame(width: 90)
          }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        
        VStack(alignment: .center) {
          Spacer()
          
          Button {
            authViewModel.googleSignIn()
          } label: {
            GoogleSignInButton()
//            Text("Sign In")
//              .font(.custom("Barlow-Bold", size: 20))
//              .padding()
//              .foregroundColor(Color("defaultLightGray"))
          }
          .frame(width: 135, height: 40)
          .padding(.all, 10)
//          .background(
//            RoundedRectangle(cornerRadius: 7)
//              .foregroundColor(.white)
//              .shadow(color: .gray, radius: 2, x: 0, y: 2)
//          )
//          .frame(width: 50, height: 50)
//          .padding(.trailing, 70)
          
          SignInWithAppleButton(
            onRequest: { request in
              authViewModel.setRequestNonce(request: request)
            },
            onCompletion: { result in
              authViewModel.executeAppleSignIn(result: result)
            }
          )
//          .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
          .frame(width: 130, height: 45)
          .padding(.all, 10)
          
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
          Spacer()
        }
        .frame(width: 130)
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
