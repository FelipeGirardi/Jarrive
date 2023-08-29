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
          }
          
          Text("Ou")
            .foregroundColor(.white)
            .font(.custom("Barlow-Regular", size: 20))
            .padding(.horizontal, 10)
          
          VStack {
            Divider()
              .background(.white)
          }
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 15)
        
        GoogleSignInButton()
        .padding(.horizontal, 50)
          .onTapGesture {
            authViewModel.signIn()
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
