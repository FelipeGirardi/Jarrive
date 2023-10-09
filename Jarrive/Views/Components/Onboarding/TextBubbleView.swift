//
//  TextBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct TextBubbleView: View {
  var content: TextBubble
  
  var getBubbleText: some View {
    var fullString = Text("")
    
    for (idx, str) in content.textArray.enumerated() {
      fullString = fullString +
      Text("[\(str.text)](myappurl://action\(idx))")
        .underline(str.translation != nil)
        .baselineOffset(str.translation != nil ? 2 : 0)
      fullString = fullString + Text(" ")
    }
    
    return fullString
  }
  
  var body: some View {
    Group {
      getBubbleText
        .font(.custom("Barlow-Medium", size: 16))
        .multilineTextAlignment(.leading)
        .foregroundColor(Color("mainDarkBlue"))
        .frame(maxWidth: 300, idealHeight: 36, maxHeight: .infinity)
        .padding(.all, 10)
    }
//    .onOpenURL { link in
//      print(link)
//    }
  }
}

struct TextBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TextBubbleView(content: TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")]))
  }
}
