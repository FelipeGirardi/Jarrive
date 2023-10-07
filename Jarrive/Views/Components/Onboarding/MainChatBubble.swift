//
//  MainChatBubble.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import SwiftUI

enum BubbleUser {
  case cat
  case user
}

enum BubbleContent {
  case text
  case response
  case options
  case audio
}

struct MainChatBubble: View {
  var userType: BubbleUser
  var content: StringOrInt
  
  var body: some View {
    ZStack {
      Image("OnboardingBG")
        .resizable()
        .aspectRatio(contentMode: .fill)
      
      Group {
        switch content {
        case .txt(let s): Text(s.text)          .font(.custom("Barlow-Medium", size: 16))
            .foregroundColor(Color("mainDarkBlue"))
            .padding(.all, 10)

        case .opt(let n): Text(n.text)          .font(.custom("Barlow-Medium", size: 16))
            .foregroundColor(Color("mainDarkBlue"))
            .padding(.all, 10)

        }
//        Text("   " + content + "   ")
//          .font(.custom("Barlow-Medium", size: 16))
//          .foregroundColor(Color("mainDarkBlue"))
//          .padding(.all, 10)
      }
      .background(.white)
      .roundedCorner(15, corners: userType == .cat ? [.topRight, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
    }
  }
}

struct MainChatBubble_Previews: PreviewProvider {
  static var previews: some View {
    MainChatBubble(userType: .cat, content: StringOrInt.txt(TextBubble(text: "Salut? Quis est la?")))
  }
}
