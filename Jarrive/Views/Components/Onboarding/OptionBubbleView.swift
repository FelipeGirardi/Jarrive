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
  @State var bubbleHeight: Double = 0.0
  @Binding var onboardingData: OnboardingData
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  var currentIndex: Int
  
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
  
  func getBubbleTextString() -> String {
    var fullString = ""
    for str in content.textArray {
      fullString = fullString + str.text
      fullString = fullString + (str == content.textArray.last ? "" : " ")
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
  
//  func maxBubbleHeight() -> Double {
//    return 60.0 + (30.0 * floor(Double(nTextCharacters())/40.0))
//  }
  
  var body: some View {
    ZStack(alignment: .center) {
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
              ForEach(content.options.indices, id: \.self) { index in
                Text(content.options[index])
                  .font(.custom("Barlow-Medium", size: 16))
                  .multilineTextAlignment(.center)
                  .minimumScaleFactor(0.5)
                  .foregroundColor(Color("mainDarkBlue"))
                  .frame(maxHeight: 30)
                  .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                  .background(Color("mainLightBlue"))
                  .cornerRadius(20)
                  .onTapGesture {
                    if onboardingData.optionPauseIndexes.contains(currentMessage) && !optionsClickedIndexes.contains(currentIndex)
                    {
                      onboardingData.catChatMessages[currentMessage+1] = BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: content.options[index], translation: nil)], respondedText: getBubbleTextString()))
                      if onboardingData.variableOptionMessageIndexes.contains(currentMessage) {
                        onboardingData.catChatMessages[currentMessage+2] = onboardingData.variableOptionFollowingMessages[onboardingData.variableOptionMessageIndexes.firstIndex(of: currentMessage)!][index]
                      }
                      optionsClickedIndexes.append(currentMessage)
                      withAnimation(.easeInOut(duration: 0.1)) {
                        currentMessage += 1
                      }
                    }
                  }
              }
              
              Spacer()
            }
          }
          .frame(maxWidth: Double(content.options.count) * 115.0)
          .frame(minHeight: 25)
          .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
          .background(.white)
          .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
          .padding(.leading, 10)
          .onTapGesture {
            showTranslations.toggle()
            bubbleHeight = 70
          }
          
          Spacer()
        }
      
      HStack {
      if showTranslations {
        TranslationBubbleView(translations: content.textArray.filter({$0.translation != nil}))
          .padding(.leading, 10)
          .onTapGesture {
              showTranslations.toggle()
          }
      }
        
        Spacer()
      }
      .offset(y: -bubbleHeight + 5)
    }
  }
}

struct OptionBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    OptionBubbleView(content: OptionBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], options: ["Train 🚂", "Croissant 🥐", "Carte postale ✉️"]), onboardingData: .constant(OnboardingData()), currentMessage: .constant(1), optionsClickedIndexes: .constant([]), currentIndex: 1)
  }
}
