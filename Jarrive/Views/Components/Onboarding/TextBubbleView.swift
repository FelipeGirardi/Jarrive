//
//  TextBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct TextBubbleView: View {
  var content: TextBubble
  var userType: BubbleUser
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
  
  func nTextCharacters() -> Int {
    var nChars = 0
    for str in content.textArray {
      nChars += str.text.count
    }
    return nChars
  }
  
  var body: some View {
    VStack(spacing: 5) {
      HStack {
        TranslationBubbleView(translations: content.textArray.filter({$0.translation != nil}))
          .opacity(showTranslations ? 1 : 0)
          .padding(.leading, 10)
          .padding(.trailing, 150)
        
        Spacer()
      }
      
      HStack {
        getBubbleText
          .font(.custom("Barlow-Medium", size: 16))
          .minimumScaleFactor(0.1)
          .multilineTextAlignment(.leading)
          .baselineOffset(2)
          .foregroundColor(Color("mainDarkBlue"))
          .frame(maxWidth: nTextCharacters() <= 40 ? 7.0 * Double(nTextCharacters()) : 250, maxHeight: 30.0 + (15.0 * floor(Double(nTextCharacters())/40.0)))
          .padding(.all, 10)
          .background(.white)
          .roundedCorner(20, corners: userType == .cat ? [.topRight, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
          .padding(.leading, 10)
          .padding(.trailing, 50)
          .onTapGesture {
            showTranslations.toggle()
          }
        
        Spacer()
      }
    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(content: TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Salut? Quis est la?", translation: nil)]), userType: BubbleUser.cat)
  }
}
