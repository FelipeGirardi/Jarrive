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
      fullString = fullString + Text(str.text).underline()
      fullString = fullString + Text(": " + str.translation!)
      if translations.last != str {
        fullString = fullString + Text("\n")
      }
    }
    
    return fullString
  }
  
  func nTranslations() -> Int {
    var nTranslations = 0
    for _ in translations {
      nTranslations += 1
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
      .padding(.all, 10)
//      .padding(.top, 10)
      .background(Color("mainGreen"))
      .cornerRadius(30)
//      .frame(maxHeight: 30.0 * Double(nTranslations()))
      
  }
}

struct TranslationBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TranslationBubbleView(translations: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Lalala", translation: "Lalala")])
  }
}
