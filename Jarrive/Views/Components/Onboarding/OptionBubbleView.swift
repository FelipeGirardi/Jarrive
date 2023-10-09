//
//  OptionBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct OptionBubbleView: View {
  var content: OptionBubble
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct OptionBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    OptionBubbleView(content: OptionBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], options: ["Human", "Chat"]))
  }
}
