//
//  MainChatBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import SwiftUI

struct MainChatBubbleView: View {
  var messageData: MessageData
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  var currentIndex: Int
  
  var body: some View {
    switch messageData.type! {
    case "text":
      TextBubbleView(messageData: messageData)
    case "option":
      OptionBubbleView(messageData: messageData, currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes, currentIndex: currentIndex)
    case "response":
      ResponseBubbleView(messageData: messageData)
    case "audio":
      AudioBubbleView(messageData: messageData)
    case "image":
      ImageBubbleView(messageData: messageData)
    default:
      // add sticker view later
      ImageBubbleView(messageData: messageData)
    }
  }
}

//struct MainChatBubbleView_Previews: PreviewProvider {
//  static var previews: some View {
//    MainChatBubbleView(content: BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: nil)], type: .cat)), onboardingData: .constant(OnboardingData()), currentMessage: .constant(1), optionsClickedIndexes: .constant([]), currentIndex: 1)
//  }
//}
