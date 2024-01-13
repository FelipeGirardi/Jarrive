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
  let onboardingData = OnboardingData()
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  var currentOptionIndex: Int
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
  
  func optionSelectedLogic(index: Int) {
    if (isOnboardingDone ? firestoreManager.postLoginOptionPauseIndexes.contains(currentMessage) : firestoreManager.onboardingOptionPauseIndexes.contains(currentMessage)) && !optionsClickedIndexes.contains(currentOptionIndex)
    {
      // add response message in chat (always happens after option is selected by user)
      firestoreManager.onboardingChatMessages[currentMessage+1] = MessageData(id: currentMessage+1, type: "response", textArray: [BubbleString(text: messageData.options![index], translation: nil)], respondedText: getBubbleTextString())
      optionsClickedIndexes.append(currentMessage)
      // !isOnboardingDone = onboarding chat option logic, isOnboardingDone = post login chat option logic
      if !isOnboardingDone {
        // uses mocked onboardingData for variable option messages
        if firestoreManager.onboardingVariableOptionMessageIndexes.contains(currentMessage) {
          if let variableMessageIndex = firestoreManager.onboardingVariableOptionMessageIndexes.firstIndex(of: currentMessage) {
            firestoreManager.onboardingChatMessages[currentMessage+2] = onboardingData.variableOptionFollowingMessages[variableMessageIndex][index]
          }
        }
      } else {
        // skips 2 messages if user presses "Oui", updates arrays of indexes
        if firestoreManager.postLoginOptionExtraMessagesIndexes.contains(currentMessage) {
          if index == 0 {
            firestoreManager.onboardingChatMessages.remove(at: currentMessage + 2)
            firestoreManager.onboardingChatMessages.remove(at: currentMessage + 2)
            firestoreManager.postLoginOptionPauseIndexes.removeAll { $0 <= currentMessage }
            firestoreManager.postLoginOptionPauseIndexes = firestoreManager.postLoginOptionPauseIndexes
              .map { $0 - 2 }
            firestoreManager.postLoginOptionExtraMessagesIndexes = firestoreManager.postLoginOptionExtraMessagesIndexes.map { $0 - 2 }
            firestoreManager.postLoginOptionTryAgainIndexes = firestoreManager.postLoginOptionTryAgainIndexes.map { $0 - 2 }
          }
        // repeats messages if user chooses wrong option, continues if user chooses correct option
        } else if firestoreManager.postLoginOptionTryAgainIndexes.contains(currentMessage) {
          if let tryAgainMessageIndex = firestoreManager.postLoginOptionTryAgainIndexes.firstIndex(of: currentMessage) {
            firestoreManager.onboardingChatMessages[currentMessage+2] = onboardingData.tryAgainFollowingMessages[tryAgainMessageIndex][index]
            let correctAnswerIndex = onboardingData.tryAgainIndexesCorrectAnswers[tryAgainMessageIndex]
            if index != correctAnswerIndex {
              let messagesToRepeatArray = Array(firestoreManager.onboardingChatMessages[currentMessage ..< currentMessage+3])
              firestoreManager.onboardingChatMessages.insert(contentsOf: messagesToRepeatArray, at: currentMessage+3)
              firestoreManager.postLoginOptionPauseIndexes = firestoreManager.postLoginOptionPauseIndexes.map { $0 + 3 }
              firestoreManager.postLoginOptionExtraMessagesIndexes = firestoreManager.postLoginOptionExtraMessagesIndexes.map { $0 + 3 }
              firestoreManager.postLoginOptionTryAgainIndexes = firestoreManager.postLoginOptionTryAgainIndexes.map { $0 + 3 }
            }
          }
        }
      }
      withAnimation(.easeInOut(duration: 0.1)) {
        currentMessage += 1
      }
    }
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
                .minimumScaleFactor(0.1)
                .font(.custom("Barlow-Medium", size: 16))
                .multilineTextAlignment(.leading)
                .baselineOffset(2)
                .foregroundColor(Color("mainDarkBlue"))
              
              Spacer()
            }
            
            HStack(spacing: 10) {
              ForEach(messageData.options!.indices, id: \.self) { index in
                Text(messageData.options![index])
                  .minimumScaleFactor(0.5)
                  .font(.custom("Barlow-Medium", size: 16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(Color("mainDarkBlue"))
                  .frame(maxHeight: 30)
                  .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                  .background(Color("mainLightBlue"))
                  .cornerRadius(20)
                  .onTapGesture {
                    optionSelectedLogic(index: index)
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
    OptionBubbleView(messageData: MessageData(type: "option", textArray: [BubbleString(text: "Bonjour ou bonsoir?", translation: "Bom dia ou boa noite?")], options: ["Bonjour", "Bonsoir"]), currentMessage: .constant(1), optionsClickedIndexes: .constant([]), currentOptionIndex: 1)
  }
}
