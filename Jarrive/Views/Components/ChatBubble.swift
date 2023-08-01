//
//  ChatBubble.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

struct ChatBubble: View {
  var body: some View {
    Text("Bonjour!")
      .font(.custom("BasicSans-Regular", size: 36))
      .padding()
      .foregroundColor(Color("mainBlue"))
      .background(
        RoundedRectangle(cornerRadius: 5, style: .continuous)
          .stroke(Color("mainBlue"), lineWidth: 4)
      )
      .overlay(alignment: .bottom) {
        Image(systemName: "arrowtriangle.down")
          .font(.title)
          .offset(y: 25)
          .foregroundColor(Color("mainBlue"))
      }
  }
}

struct ChatBubble_Previews: PreviewProvider {
  static var previews: some View {
    ChatBubble()
  }
}
