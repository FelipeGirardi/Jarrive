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
      fullString = fullString +
      Text(str.text).underline()
      fullString = fullString +
        Text(": " + str.translation! + "\n")
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
      .multilineTextAlignment(.leading)
      .baselineOffset(2)
      .foregroundColor(.black)
      .padding(.horizontal, 25)
      .frame(maxHeight: 30.0 * Double(nTranslations()))
      .minimumScaleFactor(0.5)
      .padding(.top, 15)
      .background(Color("mainGreen"))
      .cornerRadius(30)
  }
}

struct TranslationBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TranslationBubbleView(translations: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Lalala", translation: "Lalala")])
  }
}
