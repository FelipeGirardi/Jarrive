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

enum CatOrHuman {
  case cat
  case human
  case none
}

struct ChatPage: View {
  @State var animationState: ChatPageAnimationState = .name
  @State var goToNewScreen: Bool = false
  @State var nameInput: String = ""
  @State var textFieldDisabled: Bool = false
  @State var catOrHuman: CatOrHuman = .none
  
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
              if (catOrHuman == .cat || catOrHuman == .human) {
                goToNewScreen.toggle()
              }
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
      goToNewScreen ? AnyView(MainTabView()) :
      AnyView(VStack {
        animationState == .catOrHuman
        ? AnyView(EmptyView())
        : AnyView(CatChatBubble(chatBubbleText: "Je m'appelle Thomas.\n\nEt toi?")
          .padding(.top, 20))
        
        ChatTextInput(nameInput: $nameInput, textFieldDisabled: $textFieldDisabled)
          .padding(.top, animationState == .catOrHuman ? 20 : 0)
        
        CatChatBubble(chatBubbleText: "Super!\n\nJe suis un chat, et toi?")
          .padding(.top, 20)
          .opacity(animationState == .catOrHuman ? 1 : 0)
        
        CatOrHumanBubble(choice: $catOrHuman)
          .padding(.top, 20)
          .opacity(animationState == .catOrHuman ? 1 : 0)
        
        Spacer()
        Spacer()
        
        suivantButton
          .padding(.bottom, 20)
      })
    }
  }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
