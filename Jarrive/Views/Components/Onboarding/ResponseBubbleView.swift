//
//  ResponseBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct ResponseBubbleView: View {
  var content: ResponseBubble
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct ResponseBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    ResponseBubbleView(content: ResponseBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], respondedText: "Salut!"))
  }
}
