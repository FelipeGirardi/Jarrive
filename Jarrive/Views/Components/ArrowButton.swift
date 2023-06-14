//
//  ArrowButton.swift
//  Jarrive
//
//  Created by Felipe Girardi on 14/06/23.
//

import SwiftUI

struct ArrowButton: View {
  let label: String
  
    var body: some View {
      Button(action: {
        print("Change postcard")
      }) {
        Text(label)
          .frame(width: 33, height: 33)
          .background(Color("defaultDarkGray"))
          .foregroundColor(Color("defaultDark"))
          .cornerRadius(2)
          .shadow(color: Color("defaultDark"), radius: 2, x: 0, y: 2)
          .clipShape(Circle())
          .background(
            Circle()
              .foregroundColor(Color("defaultDark"))
              .offset(x: 0, y: 2)
          )
      }
    }
}

struct ArrowButton_Previews: PreviewProvider {
    static var previews: some View {
      ArrowButton(label: "←")
    }
}
