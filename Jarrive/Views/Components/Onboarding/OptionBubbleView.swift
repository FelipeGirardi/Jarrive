//
//  OptionBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct OptionBubbleView: View {
  var content: OptionBubble
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
        VStack {
          HStack {
            getBubbleText
              .font(.custom("Barlow-Medium", size: 16))
              .multilineTextAlignment(.leading)
              .minimumScaleFactor(0.1)
              .baselineOffset(2)
              .foregroundColor(Color("mainDarkBlue"))
            
            Spacer()
          }
          
          HStack(spacing: 10) {
            ForEach(content.options, id: \.self) { option in
              Text(option)
                .font(.custom("Barlow-Medium", size: 16))
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
                .foregroundColor(Color("mainDarkBlue"))
                .frame(maxHeight: 30)
                .padding(.all, 10)
                .background(Color("mainLightBlue"))
                .cornerRadius(20)
                .onTapGesture {
                  print("option")
                }
            }
          }
        }
        .frame(maxWidth: Double(content.options.count) * 110.0, maxHeight: 80.0 + (40.0 * floor(Double(nTextCharacters())/40.0)))
        .padding(.all, 10)
        .background(.white)
        .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
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

struct OptionBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    OptionBubbleView(content: OptionBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], options: [" Train 🚂", "Croissant 🥐"]))
  }
}
