//
//  TextBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct TextBubbleView: View {
  var content: TextBubble
  @State var showTranslations: Bool = false
  @State var bubbleHeight: Double = 0.0
  
  var getBubbleText: some View {
    var fullString = Text("")
    
    for str in content.textArray {
      fullString = fullString +
      Text(str.text)
        .underline(str.translation != nil)
      fullString = fullString + Text(" ")
    }
    
    return fullString
  }
  
  var body: some View {
    ZStack(alignment: .bottom) {
//      GeometryReader { g in
        HStack {
          if content.type == .user {
            Spacer()
          }
          
          getBubbleText
            .font(.custom("Barlow-Medium", size: 16))
            .minimumScaleFactor(0.1)
            .multilineTextAlignment(.leading)
            .baselineOffset(2)
            .foregroundColor(Color("mainDarkBlue"))
            .frame(minHeight: 25)
            .padding(.all, 10)
            .background(.white)
            .roundedCorner(20, corners: content.type == .cat ? [.topRight, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
            .padding(.leading, content.type == .cat ? 10 : 50)
            .padding(.trailing, content.type == .cat ? 50 : 10)
            .onTapGesture {
              showTranslations.toggle()
              bubbleHeight = 40
            }
          
          if content.type == .cat {
            Spacer()
          }
        }
      
      HStack {
        TranslationBubbleView(translations: content.textArray.filter({$0.translation != nil}))
          .opacity(showTranslations ? 1 : 0)
          .padding(.leading, 10)
          .padding(.trailing, 150)
        
        Spacer()
      }
      .offset(y: -bubbleHeight - 2)
    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(content: TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], type: .cat))
  }
}
