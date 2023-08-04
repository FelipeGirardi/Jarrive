//
//  ChatPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

enum ChatPageAnimationState {
  case name
  case catOrHuman
}

struct ChatPage: View {
  @State var animationState: ChatPageAnimationState = .name
  @State var goToNewScreen: Bool = false
  @State var nameInput: String = ""
  @State var textFieldDisabled: Bool = false
  
  var suivantButton: some View {
    HStack {
      Spacer()
      Spacer()

      SuivantButton()
        .onTapGesture {
          withAnimation {
            switch animationState {
            case .name:
              if (nameInput != "") {
                animationState = .catOrHuman
                textFieldDisabled.toggle()
              }
            case .catOrHuman:
              goToNewScreen.toggle()
            }
          }
        }
        .padding(.horizontal, 10)
      
      PlayAudioButton()
      PlayAudioButton()
      
      Spacer()
    }
  }
  
  var body: some View {
    VStack {
      CatChatBubble(chatBubbleText: "Je m'appelle Thomas.\n\nEt toi?")
        .padding(.top, 20)
        .opacity(animationState == .catOrHuman ? 0.3 : 1)
      ChatTextInput(nameInput: $nameInput, textFieldDisabled: $textFieldDisabled)
      Spacer()
      Spacer()
      Spacer()
      suivantButton
      Spacer()
    }
  }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
