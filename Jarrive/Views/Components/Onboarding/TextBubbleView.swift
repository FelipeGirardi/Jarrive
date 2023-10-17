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
    VStack(spacing: 0) {
      TranslationBubbleView(translations: content.textArray.filter({$0.translation != nil}))
        .opacity(showTranslations ? 1 : 0)
      
      getBubbleText
        .font(.custom("Barlow-Medium", size: 16))
        .minimumScaleFactor(0.1)
        .multilineTextAlignment(.leading)
        .baselineOffset(2)
        .foregroundColor(Color("mainDarkBlue"))
        .frame(maxWidth: 200, maxHeight: 50)
        .minimumScaleFactor(0.1)
        .padding(.all, 10)
        .cornerRadius(10)
        .onTapGesture {
          showTranslations.toggle()
        }
    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(content: TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Lalala", translation: nil)]))
  }
}
