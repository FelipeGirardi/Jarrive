//
//  BackButton.swift
//  Jarrive
//
//  Created by Felipe Girardi on 14/06/23.
//

import SwiftUI

struct BackButton: View {
  let label: String
  
    var body: some View {
      Button {
        print("Go back")
      } label: {
        Text(label)
          .font(.system(size: 15))
          .fontWeight(.bold)
          .padding(10)
          .background(Color("defaultLightGray"))
          .foregroundColor(Color("defaultDarkerGray"))
          .cornerRadius(2)
          .shadow(color: Color("defaultDarkerGray"), radius: 2, x: 0, y: 2)
          .background(
            RoundedRectangle(cornerRadius: 2)
              .foregroundColor(Color("defaultDarkerGray"))
              .offset(x: 0, y: 2)
          )
          .padding(.leading, 37)
      }
//      .background(Color("defaultLightGray"))
//      .foregroundColor(Color("defaultDarkerGray"))
//      .cornerRadius(2)
//      .shadow(color: Color("defaultDarkerGray"), radius: 2, x: 0, y: 2)
//      .padding(.leading, 37)
//      .frame(idealWidth: 83, idealHeight: 33)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
      BackButton(label: "← Route 1")
    }
}
