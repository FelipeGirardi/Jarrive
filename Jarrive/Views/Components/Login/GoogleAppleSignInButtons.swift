//
//  GoogleAppleSignInButtons.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/08/23.
//

import SwiftUI

struct GoogleAppleSignInButtons: View {
  @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
      VStack {
        HStack {
          VStack {
            Divider()
              .background(.white)
              .frame(width: 100)
          }
          
          Text("Ou entre com")
            .foregroundColor(.white)
            .font(.custom("Barlow-Regular", size: 14))
            .lineLimit(1)
            .padding(.horizontal, 10)
          
          VStack {
            Divider()
              .background(.white)
              .frame(width: 100)
          }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        
        HStack(spacing: 70) {
          Spacer()
          
          VStack(spacing: 8) {
            Button {
              authViewModel.signIn()
            } label: {
              Image("GoogleButton")
                .resizable()
                .frame(width: 50, height: 50)
            }
            
            Text("Google")
              .foregroundColor(.white)
              .font(.custom("Barlow-Bold", size: 16))
          }
          
          VStack(spacing: 8) {
            Button {
              // Sign in with Apple
            } label: {
              Image("AppleButton")
                .resizable()
                .frame(width: 50, height: 50)
            }
            
            Text("Apple")
              .foregroundColor(.white)
              .font(.custom("Barlow-Bold", size: 16))
          }
          
          Spacer()
        }
//        Button(action: {
//          print("Login")
//        }) {
//          Text("Apple")
//            .padding(10)
//            .foregroundColor(.black)
//            .overlay(
//              RoundedRectangle(
//                cornerRadius: 5,
//                style: .continuous
//              )
//              .stroke(.gray, lineWidth: 2)
//            )
//        }
        
//        Spacer()
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
