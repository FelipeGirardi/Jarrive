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
            .frame(height: g.size.height * 0.15)
          
//          Text("J'arrive")
//            .font(.custom("BasicSans-Regular", size: 48))
//            .foregroundColor(Color("mainBlue"))
          
          Image("ThomasCat")
            .resizable()
            .frame(width: 120, height: 120)
          
          Spacer(minLength: 50)
          
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
