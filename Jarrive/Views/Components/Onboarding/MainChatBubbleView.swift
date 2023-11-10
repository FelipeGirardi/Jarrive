//
//  MainChatBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import SwiftUI

struct MainChatBubbleView: View {
  var content: BubbleContent
  @Binding var onboardingData: OnboardingData
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  var currentIndex: Int
  
  var body: some View {
    switch content {
    case .text(let textContent):
      TextBubbleView(content: textContent!)
    case .option(let optionContent):
      OptionBubbleView(content: optionContent!, onboardingData: $onboardingData, currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes, currentIndex: currentIndex)
    case .response(let responseContent):
      ResponseBubbleView(content: responseContent!)
    case .audio(let audioContent):
      AudioBubbleView(content: audioContent!)
    case .image(let imageContent):
      ImageBubbleView(content: imageContent!)
    }
  }
}

struct MainChatBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    MainChatBubbleView(content: BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: nil)], type: .cat)), onboardingData: .constant(OnboardingData()), currentMessage: .constant(1), optionsClickedIndexes: .constant([]), currentIndex: 1)
  }
}
