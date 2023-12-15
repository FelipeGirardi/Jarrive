//
//  LoginScreen.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/06/23.
//

import SwiftUI

struct LoginScreen: View {
  var body: some View {
    GeometryReader { g in
        VStack {
          Spacer()
          
          Image("JarriveLogo1")
            .resizable()
            .frame(width: 245, height: 95)
          
          Spacer()
          
          ZStack {
            LoginInputView()
          }
          .frame(width: .infinity, height: g.size.height * 0.75)
          .background(Color("mainBlue"))
          .roundedCorner(30, corners: [.topLeft, .topRight])
          .offset(y: 35)
        }
    }
  }
}

struct LoginScreen_Previews: PreviewProvider {
  static var previews: some View {
    LoginScreen()
  }
}
