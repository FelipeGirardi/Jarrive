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
    case "sticker":
      StickerBubbleView(messageData: messageData)
    default:
      EmptyView()
    }
  }
}
