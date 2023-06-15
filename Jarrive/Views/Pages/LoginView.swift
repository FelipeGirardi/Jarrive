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
      HStack {
        Spacer()
        VStack {
          Spacer()
            .frame(height: g.size.height * 0.2)
          
          Image("catOnFlowers")
            .resizable()
            .frame(width: 100, height: 100)
          
          Spacer()
          
          LoginInputView()
        }
        Spacer()
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
