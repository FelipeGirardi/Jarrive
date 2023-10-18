//
//  ResponseBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct ResponseBubbleView: View {
  var content: ResponseBubble
  
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
    HStack {
      Spacer()
      
      VStack(spacing: 10) {
        HStack {
          Spacer()
          
          Text(content.respondedText)
            .font(.custom("Barlow-Medium", size: 16))
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.1)
            .foregroundColor(Color("defaultDarkerGray"))
            .frame(maxHeight: 40.0 * ceil(Double(content.respondedText.count)/40.0))
            .padding(.all, 10)
            .background(Color("defaultLightGray"))
            .cornerRadius(20)
        }
        
        HStack {
          Spacer()
          
          getBubbleText
            .font(.custom("Barlow-Medium", size: 16))
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.1)
            .baselineOffset(2)
            .foregroundColor(Color("mainDarkBlue"))
        }
      }
      .frame(maxWidth: content.respondedText.count <= 40 ? 7.0 * Double(content.respondedText.count) : 250, maxHeight: 80.0 + (40.0 * floor(Double(nTextCharacters())/40.0)))
      .padding(.all, 10)
      .background(.white)
      .roundedCorner(20, corners: [.topLeft, .topRight, .bottomLeft])
      .padding(.trailing, 10)
      .padding(.leading, 50)
    }
  }
}

struct ResponseBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    ResponseBubbleView(content: ResponseBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: nil)], respondedText: "bonjour ☀️ ? ou bonsoir 🌙 ?"))
  }
}
