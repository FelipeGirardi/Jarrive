//
//  TranslationBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 16/10/23.
//

import SwiftUI

struct TranslationBubbleView: View {
  var translations: [BubbleString]
  
  var getTranslationsText: some View {
    var fullString = Text("")
    
    for str in translations {
      if str.translation != nil {
        fullString = fullString + Text(str.text).underline()
        fullString = fullString + Text(": " + str.translation!)
        if translations.last != str {
          fullString = fullString + Text("\n")
        }
      }
    }
    
    return fullString
  }
  
  func nTranslations() -> Int {
    var nTranslations = 0
    for t in translations {
      if t.translation != nil {
        nTranslations += 1
      }
    }
    return nTranslations
  }
  
  var body: some View {
    getTranslationsText
      .font(.custom("Barlow-Medium", size: 16))
      .minimumScaleFactor(0.1)
      .multilineTextAlignment(.leading)
      .baselineOffset(2)
      .foregroundColor(.black)
      .padding(.all, 15)
      .background(Color("mainGreen"))
      .cornerRadius(30)
      .opacity(nTranslations() <= 0 ? 0 : 1)
      .overlay(alignment: .bottom) {
        Image(systemName: "arrowtriangle.down.fill")
          .font(.title)
          .offset(x: -20, y: 20)
          .foregroundColor(Color("mainGreen"))
      }
      .offset(y: -15)
  }
}

struct TranslationBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TranslationBubbleView(translations: [BubbleString(text: "Salut?", translation: "Ola")])
  }
}
