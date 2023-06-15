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
  
  var body: some View {
    GeometryReader { g in
      HStack {
        Spacer()
        VStack {
          Spacer()
          VStack {
            TextField("Usuário", text: $user)
              .multilineTextAlignment(.center)
              .cornerRadius(5)
              .frame(width: g.size.width * 0.65, height: 20)
              .padding(10)
              .overlay(
                RoundedRectangle(
                  cornerRadius: 5,
                  style: .continuous
                )
                .stroke(.black, lineWidth: 1)
              )
            
            TextField("Senha", text: $password)
              .multilineTextAlignment(.center)
              .cornerRadius(5)
              .frame(width: g.size.width * 0.65, height: 20)
              .padding(10)
              .overlay(
                RoundedRectangle(
                  cornerRadius: 5,
                  style: .continuous
                )
                .stroke(.black, lineWidth: 1)
              )
            
            Button(action: {
              print("Login")
            }) {
              Text("Entrar")
                .font(.system(size: 12))
                .fontWeight(.regular)
                .frame(width: g.size.width * 0.65, height: 20)
                .padding(10)
                .foregroundColor(.black)
                .background(
                  RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous
                  )
                  .fill(Color("defaultLightGray"))
                )
                .overlay(
                  RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous
                  )
                  .stroke(.black, lineWidth: 1)
                )
            }
            .padding(.vertical, 20)
          }
          
          Spacer()
          
          Text("ou acessar com")
            .font(.system(size: 14))
            .fontWeight(.regular)
          
          HStack(spacing: 10) {
            Button(action: {
              print("Login")
            }) {
              Text("Google")
                .padding(10)
                .foregroundColor(.black)
                .overlay(
                  RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous
                  )
                  .stroke(.gray, lineWidth: 2)
                )
            }
            
            Button(action: {
              print("Login")
            }) {
              Text("Apple")
                .padding(10)
                .foregroundColor(.black)
                .overlay(
                  RoundedRectangle(
                    cornerRadius: 5,
                    style: .continuous
                  )
                  .stroke(.gray, lineWidth: 2)
                )
            }
          }
          
          Spacer()
          
          VStack(spacing: 0) {
            Text("não possui uma conta?")
              .font(.system(size: 14))
              .fontWeight(.regular)
            
            Text("cadastre-se")
              .font(.system(size: 14))
              .fontWeight(.regular)
              .underline()
          }
          Spacer()
        }
        Spacer()
      }
    }
  }
}

struct LoginInputView_Previews: PreviewProvider {
  static var previews: some View {
    LoginInputView()
  }
}
