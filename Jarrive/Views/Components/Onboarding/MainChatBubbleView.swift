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
    ZStack {
      Image("OnboardingBG")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
      
      Group {
        switch content {
        case .text(let textContent):
          TextBubbleView(content: textContent, userType: userType)
        case .option(let optionContent):
          OptionBubbleView(content: optionContent, userType: userType)
        case .response(let responseContent):
          ResponseBubbleView(content: responseContent, userType: userType)
        case .audio(let audioContent):
          AudioBubbleView(content: audioContent, userType: userType)
        }
      }
    }
  }
}

struct MainChatBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    MainChatBubbleView(userType: .cat, content: BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je m'appelle", translation: "Eu me chamo"), BubbleString(text: "Thomas, e você?", translation: nil)])))
  }
}
