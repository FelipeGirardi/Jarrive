//
//  SuivantButton.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

struct SuivantButton: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 70)
        .frame(width: 115, height: 35)
        .foregroundColor(.black)
        .offset(x: 0, y: 4)
      
      Text("suivant")
        .font(.custom("BasicSans-Regular", size: 16))
        .frame(width: 115, height: 35)
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

struct SuivantButton_Previews: PreviewProvider {
  static var previews: some View {
    SuivantButton()
  }
}
