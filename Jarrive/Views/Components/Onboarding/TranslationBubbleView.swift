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
  
  var body: some View {
    getTranslationsText
      .font(.custom("Barlow-Medium", size: 16))
      .multilineTextAlignment(.leading)
      .baselineOffset(2)
      .foregroundColor(.black)
      .frame(maxWidth: 200, maxHeight: 50)
      .minimumScaleFactor(0.1)
      .padding(.top, 10)
      .padding(.horizontal, 10)
      .background(Color("mainGreen"))
      .cornerRadius(30)
  }
}

struct TranslationBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    TranslationBubbleView(translations: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?"), BubbleString(text: "Lalala", translation: "Lalala")])
  }
}
