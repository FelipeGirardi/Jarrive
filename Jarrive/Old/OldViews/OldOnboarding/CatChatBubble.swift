//
//  CatChatBubble.swift
//  Jarrive
//
//  Created by Felipe Girardi on 04/08/23.
//

import SwiftUI

struct CatChatBubble: View {
  var chatBubbleText: String

  var body: some View {
    VStack(spacing: 0) {
      HStack {
        ZStack {
          Image("chatBubble3")
            .resizable()
            .frame(width: 233, height: 100)
          
          Text(chatBubbleText)
            .font(.custom("BasicSans-Regular", size: 16))
            .foregroundColor(Color("mainBlue"))
            .offset(x: -20, y: -10)
        }
        PlayAudioButton()
        PlayAudioButton()
        
        Spacer()
      }
      .padding(.leading, 50)
      
      HStack {
        Image("ThomasCatHead")
          .resizable()
          .frame(width: 72, height: 72)
          .padding(.leading, 22)
        Spacer()
      }
    }
  }
}

struct CatChatBubble_Previews: PreviewProvider {
  static var previews: some View {
    CatChatBubble(chatBubbleText: "Je m'appelle Thomas.\n\nEt toi?")
  }
}
