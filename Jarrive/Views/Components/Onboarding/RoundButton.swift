//
//  RoundButton.swift
//  Jarrive
//
//  Created by Felipe Girardi on 20/08/23.
//

import SwiftUI

struct RoundButton: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 70)
        .frame(width: 30, height: 30)
        .foregroundColor(.black)
        .offset(x: -2, y: 2)
      
      Text("")
        .font(.custom("BasicSans-Regular", size: 16))
        .frame(width: 25, height: 25)
        .foregroundColor(Color("mainBlue"))
        .background(
          RoundedRectangle(cornerRadius: 70, style: .continuous)
            .foregroundColor(.white)
        )
        .background(
          RoundedRectangle(cornerRadius: 70, style: .continuous)
            .stroke(Color("mainBlue"), lineWidth: 4)
        )
    }
  }
}

struct RoundButton_Previews: PreviewProvider {
  static var previews: some View {
    RoundButton()
  }
}
