//
//  TextBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}

struct TextBubbleView: View {
  var messageData: MessageData
  @State var showTranslations: Bool = false
  @State var bubbleHeight: Double = 0.0
  
  var getBubbleText: some View {
    var fullString = Text("")
    let punctuations = ",.!?:;()"
    
    for (index, str) in messageData.textArray!.enumerated() {
      fullString = fullString +
      Text(str.text.replacingOccurrences(of: "\\n", with: "\n"))
        .underline(str.translation != nil)
      // check if should remove space in case of punctuation
      fullString = fullString + (messageData.textArray!.indices.contains(index+1) ? (punctuations.contains(messageData.textArray![index+1].text.first!) ? Text("") : Text(" ")) : Text(" "))
    }
    
    return fullString
  }
  
  var body: some View {
    ZStack(alignment: .center) {
        HStack {
          if messageData.user == "user" {
            Spacer()
          }
          
          getBubbleText
            .minimumScaleFactor(0.1)
            .font(.custom("Barlow-Medium", size: 16))
            .multilineTextAlignment(.leading)
            .baselineOffset(2)
            .foregroundColor(Color("mainDarkBlue"))
            .frame(minHeight: 25)
            .padding(.all, 8)
            .background(.white)
            .roundedCorner(20, corners: messageData.user == "cat" ? [.topRight, .bottomLeft, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
            .padding(.leading, messageData.user == "cat" ? 10 : 50)
            .padding(.trailing, messageData.user == "cat" ? 0 : 10)
            .onTapGesture {
              withAnimation(.easeOut(duration: 0.1)) {
                showTranslations.toggle()
              }
              bubbleHeight = 40
            }
          
          if messageData.user == "cat" {
            Spacer()
          }
        }
        .padding(.trailing, messageData.user == "cat" ? 50 : 0)
      
      HStack {
        if messageData.user == "user" {
          Spacer()
        }
        
        TranslationBubbleView(translations: messageData.textArray!.filter({$0.translation != nil}))
          .opacity(showTranslations ? 1 : 0)
          .padding(.leading, messageData.user == "cat" ? 10 : 50)
          .padding(.trailing, messageData.user == "cat" ? 0 : 10)
          .offset(y: -bubbleHeight)
          .onTapGesture {
            withAnimation(.easeOut(duration: 0.1)) {
              showTranslations.toggle()
            }
          }
        
        if messageData.user == "cat" {
          Spacer()
        }
      }
    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(messageData: MessageData(type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour!", translation: "Bom dia!")]))
  }
}
