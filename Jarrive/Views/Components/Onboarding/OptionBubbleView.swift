//
//  OptionBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct OptionBubbleView: View {
  var messageData: MessageData
  @State var showTranslations: Bool = false
  @State var bubbleHeight: Double = 0.0
  @EnvironmentObject var firestoreManager: FirestoreManager
  var onboardingData = OnboardingData()
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  var currentIndex: Int
  @State private var isOnboardingDone = UserDefaults.standard.bool(forKey: "isOnboardingDone")
  
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
  
  func getBubbleTextString() -> String {
    var fullString = ""
    for str in messageData.textArray! {
      fullString = fullString + str.text
      fullString = fullString + (str == messageData.textArray!.last ? "" : " ")
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
              ForEach(messageData.options!.indices, id: \.self) { index in
                Text(messageData.options![index])
                  .font(.custom("Barlow-Medium", size: 16))
                  .multilineTextAlignment(.center)
                  .minimumScaleFactor(0.5)
                  .foregroundColor(Color("mainDarkBlue"))
                  .frame(maxHeight: 30)
                  .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                  .background(Color("mainLightBlue"))
                  .cornerRadius(20)
                  .onTapGesture {
                    if (isOnboardingDone ? firestoreManager.postLoginOptionPauseIndexes.contains(currentMessage) : firestoreManager.onboardingOptionPauseIndexes.contains(currentMessage)) && !optionsClickedIndexes.contains(currentIndex)
                    {
                      firestoreManager.onboardingChatMessages[currentMessage+1] = MessageData(id: currentMessage+1, type: "response", textArray: [BubbleString(text: messageData.options![index], translation: nil)], respondedText: getBubbleTextString())
                      // uses mocked onboardingData for variable option messages
                      if firestoreManager.onboardingVariableOptionMessageIndexes.contains(currentMessage) {
                        firestoreManager.onboardingChatMessages[currentMessage+2] = onboardingData.variableOptionFollowingMessages[firestoreManager.onboardingVariableOptionMessageIndexes.firstIndex(of: currentMessage)!][index]
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
          .frame(maxWidth: Double(messageData.options!.count) * 115.0)
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
        TranslationBubbleView(translations: messageData.textArray!.filter({$0.translation != nil}))
          .opacity(showTranslations ? 1 : 0)
          .padding(.leading, 10)
          .onTapGesture {
              showTranslations.toggle()
          }
        
        Spacer()
      }
      .offset(y: -bubbleHeight)
    }
  }
}

struct OptionBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    OptionBubbleView(messageData: MessageData(type: "option", textArray: [BubbleString(text: "Bonjour ou bonsoir?", translation: "Bom dia ou boa noite?")], options: ["Bonjour", "Bonsoir"]), currentMessage: .constant(1), optionsClickedIndexes: .constant([]), currentIndex: 1)
  }
}
