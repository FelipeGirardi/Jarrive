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
    ZStack(alignment: .center) {
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
            .padding(.all, 8)
            .background(.white)
            .roundedCorner(20, corners: content.type == .cat ? [.topRight, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
            .padding(.leading, content.type == .cat ? 10 : 50)
            .padding(.trailing, content.type == .cat ? 0 : 10)
            .onTapGesture {
              withAnimation(.easeOut(duration: 0.1)) {
                showTranslations.toggle()
              }
              bubbleHeight = 40
            }
          
          if content.type == .cat {
            Spacer()
          }
        }
      
      HStack {
        if content.type == .user {
          Spacer()
        }
        
        TranslationBubbleView(translations: content.textArray.filter({$0.translation != nil}))
          .opacity(showTranslations ? 1 : 0)
          .padding(.leading, content.type == .cat ? 10 : 50)
          .padding(.trailing, content.type == .cat ? 0 : 10)
          .offset(y: -bubbleHeight)
          .onTapGesture {
            withAnimation(.easeOut(duration: 0.1)) {
              showTranslations.toggle()
            }
          }
        
        if content.type == .cat {
          Spacer()
        }
      }
    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(content: TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], type: .cat))
  }
}
