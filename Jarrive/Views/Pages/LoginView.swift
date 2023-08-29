//
//  LoginView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/06/23.
//

import SwiftUI

struct LoginView: View {
  var body: some View {
    GeometryReader { g in
        VStack {
          Spacer()
            .frame(height: g.size.height * 0.1)
          
          Image("JarriveLogo1")
            .resizable()
            .frame(width: 245, height: 95)
          
          Spacer(minLength: 50)
          
          ZStack {
            LoginInputView()
          }
          .frame(maxWidth: .infinity, maxHeight: g.size.height * 0.8)
          .background(Color("mainBlue"))
          .roundedCorner(30, corners: [.topLeft, .topRight])
          .offset(y: 35)
        }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
