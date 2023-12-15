//
//  LoginInputView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/06/23.
//

import SwiftUI

struct LoginInputView: View {
  @State private var user: String = ""
  @State private var password: String = ""
  @EnvironmentObject var authViewModel: AuthenticationViewModel
  
  var body: some View {
    GeometryReader { g in
      HStack {
        Spacer()
        VStack {
          Spacer()
        HStack {
          Spacer()
          Text("Entre na sua conta")
            .font(.custom("Barlow-Bold", size: 20))
            .foregroundColor(.white)
            .padding(.bottom)
          Spacer()
          Spacer()
          Spacer()
        }
          Spacer()
          VStack {
            TextField("Usuário", text: $user)
              .frame(width: g.size.width * 0.65, height: 25)
              .padding(10)
              .background(.white)
              .cornerRadius(30)
            
            SecureField("Senha", text: $password)
              .frame(width: g.size.width * 0.65, height: 25)
              .padding(10)
              .background(.white)
              .cornerRadius(30)
            
//            HStack {
//              Spacer()
//              Text("Lembrar senha")
//              Spacer()
//              Text("Recuperar senha")
//              Spacer()
//            }
            
            Button(action: {
              print("Login")
            }) {
              Text("Entrar")
                .font(.custom("Barlow-Bold", size: 20))
                .frame(width: g.size.width * 0.65, height: 25)
                .padding(10)
                .foregroundColor(.white)
                .background(
                  RoundedRectangle(
                    cornerRadius: 30,
                    style: .continuous
                  )
                  .fill(Color("mainDarkBlue"))
                )
            }
            .padding(.vertical, 20)
          }
          
          Spacer()
          
          GoogleAppleSignInButtons()
          
//          HStack {
//            Text("Não tem conta?")
//              .font(.custom("Barlow-Regular", size: 16))
//              .foregroundColor(.white)
//            
//            Text("Cadastre-se aqui.")
//              .font(.custom("Barlow-Bold", size: 16))
//              .foregroundColor(.white)
//              .underline()
//              .onTapGesture {
//                print("Go to sign up page")
//              }
//          }
//          .padding(.bottom, 50)
          
          Spacer()
          Spacer()
        }
        .padding(.top, 50)
        Spacer()
      }
    }
    .background(Color("mainBlue"))
  }
}

struct LoginInputView_Previews: PreviewProvider {
  static var previews: some View {
    LoginInputView()
  }
}
