//
//  ResponseBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct ResponseBubbleView: View {
  var messageData: MessageData
  
  var getBubbleText: some View {
    var fullString = Text("")
    
    for str in messageData.textArray! {
      fullString = fullString +
      Text(str.text)
        .underline(str.translation != nil)
      fullString = fullString + Text(" ")
    }
    
    return fullString
  }
  
  func nTextCharacters() -> Int {
    var nChars = 0
    for str in messageData.textArray! {
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
          
          Text(messageData.respondedText!)
            .font(.custom("Barlow-Medium", size: 16))
            .multilineTextAlignment(.leading)
            .minimumScaleFactor(0.5)
            .foregroundColor(Color("defaultDarkerGray"))
            .frame(maxHeight: 25)
//            .frame(maxHeight: 20.0 * ceil(Double(messageData.respondedText.count)/20.0))
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(Color("defaultLightGray"))
            .cornerRadius(20)
        }
        
        HStack {
          Spacer()
          
          getBubbleText
            .font(.custom("Barlow-Medium", size: 16))
            .multilineTextAlignment(.leading)
            .foregroundColor(Color("mainDarkBlue"))
        }
      }
//      .frame(maxWidth: Double(messageData.respondedText.count * 120))
//      .frame(maxWidth: messageData.respondedText.count <= 40 ? 10.0 * Double(messageData.respondedText.count) : 250)
      .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
      .frame(maxWidth: 180)
      .frame(minHeight: 25)
      .background(.white)
      .roundedCorner(20, corners: [.topLeft, .topRight, .bottomLeft])
      .padding(.trailing, 10)
      .padding(.leading, 50)
    }
  }
}

struct ResponseBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    ResponseBubbleView(messageData: MessageData(type: "response", textArray: [BubbleString(text: "Chat 😸", translation: nil)], respondedText: "Human ou chat?"))
  }
}
