//
//  MainChatBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import SwiftUI

enum BubbleUser {
  case cat
  case user
}

struct MainChatBubbleView: View {
  var userType: BubbleUser
  var content: BubbleContent
  
  var body: some View {
    switch content {
    case .text(let textContent):
      TextBubbleView(content: textContent, userType: userType)
    case .option(let optionContent):
      OptionBubbleView(content: optionContent)
    case .response(let responseContent):
      ResponseBubbleView(content: responseContent)
    case .audio(let audioContent):
      AudioBubbleView(content: audioContent)
    case .image(let imageContent):
      ImageBubbleView(content: imageContent)
    }
  }
}

struct MainChatBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    MainChatBubbleView(userType: .cat, content: BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: nil)], respondedText: "bonjour ☀️ ? ou bonsoir 🌙 ?")))
  }
}
