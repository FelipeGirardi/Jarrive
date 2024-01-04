//
//  OnboardingMainScreen.swift
//  Jarrive
//
//  Created by Felipe Girardi on 06/10/23.
//

import SwiftUI

struct OnboardingMainScreen: View {
  @State var isBlurViewOn: Bool = false
  @State var currentMessage: Int = 0
  @State var messagesTimer: Int = 2
  @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State var textFieldText = ""
  @State var optionsClickedIndexes: [Int] = []
  @State var changeScreenToPostcard = false
  @FocusState private var isFocused: Bool
  @EnvironmentObject var firestoreManager: FirestoreManager
  
  func isChatFlowStopped() -> Bool {
    return firestoreManager.onboardingPauseMessageFluxIndexes.contains(currentMessage) ||
    currentMessage == firestoreManager.onboardingChatMessages.count - 1
  }
  
  func isTextFieldActive() -> Bool {
    return firestoreManager.onboardingUserTextFieldPauseIndexes.contains(currentMessage)
  }
  
  func shouldChangeScreenToPostcard() -> Bool {
    return currentMessage == firestoreManager.onboardingChatMessages.count - 1
  }
  
  var userTextField: some View {
    HStack {
      TextField("", text: $textFieldText, prompt: isTextFieldActive() ? Text("Digite...").foregroundColor(Color("defaultDarkerGray")) : Text(""))
        .focused($isFocused)
        .foregroundColor(Color("defaultDarkerGray"))
        .disabled(!isTextFieldActive())
      
      ZStack(alignment: .center) {
        RoundedRectangle(cornerRadius: 30)
          .frame(width: 45, height: 45)
          .foregroundColor(Color("mainLightBlue"))

        Image("paperPlane")
          .foregroundColor(.white)
          .padding(.trailing, 2)
          .onTapGesture {
            if isTextFieldActive() {
              firestoreManager.onboardingChatMessages[currentMessage+1] = MessageData(id: currentMessage+1, type: "text", user: "user", textArray: [BubbleString(text: textFieldText, translation: nil)])
              textFieldText = ""
              withAnimation(.easeInOut(duration: 0.1)) {
                currentMessage += 1
              }
              timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
          }
      }
      
    }
    .textFieldStyle(OvalTextFieldStyle())
    .ignoresSafeArea(.keyboard)
    .padding(.horizontal, 10)
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        ZStack {
          Image("OnboardingBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
          
          VStack {
            Spacer()
            
            MainChatScrollView(currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes)
            
            Spacer()
            userTextField
            Spacer()
          }
          .ignoresSafeArea(.keyboard)
          .padding(.bottom, 50)
          .offset(y: isFocused ? -175 : 0)
        }
        .brightness(isBlurViewOn ? -0.2 : 0)
        .blur(radius: isBlurViewOn ? 20 : 0)
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            OnboardingToolbar(isChatFlowStopped: isChatFlowStopped)
          }
        }
        .toolbarBackground(.white, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        
        if isBlurViewOn {
          UnderlinedWordsBlurView(isBlurViewOn: $isBlurViewOn)
        }
        
      }
      .onReceive(timer) { _ in
        if messagesTimer > 0 {
          messagesTimer -= 1
        } else {
          messagesTimer = 3
          withAnimation(.easeInOut(duration: 0.1)) {
            currentMessage += 1
          }
          
          if currentMessage == 1 {
            isBlurViewOn.toggle()
          }
          
          if isChatFlowStopped() {
            timer.upstream.connect().cancel()
          }
          
          if shouldChangeScreenToPostcard() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
              changeScreenToPostcard.toggle()
            }
          }
        }
      }
      .onChange(of: firestoreManager.onboardingChatMessages) { _ in
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      }
      .navigationDestination(isPresented: $changeScreenToPostcard) {
        PostcardScreen(postcardData: firestoreManager.firstPostcard)
      }
    }
  }
}

struct MainChatScrollView: View {
  @Binding var currentMessage: Int
  @Binding var optionsClickedIndexes: [Int]
  @EnvironmentObject var firestoreManager: FirestoreManager
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        ForEach(firestoreManager.onboardingChatMessages[0 ... currentMessage].indices.reversed(), id: \.self) { index in
          MainChatBubbleView(messageData: firestoreManager.onboardingChatMessages[0 ... currentMessage][index], currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes, currentIndex: index)
            .rotationEffect(Angle(radians: .pi)) // rotate each item
            .scaleEffect(x: -1, y: 1, anchor: .center)
            .fixedSize(horizontal: false, vertical: true)
            .zIndex(Double(index))
        }
      }
    }
    .rotationEffect(Angle(radians: .pi)) // rotate the whole ScrollView 180º
    .scaleEffect(x: -1, y: 1, anchor: .center)
    .padding(.bottom, 15)
    .padding(.top, 80)
    .edgesIgnoringSafeArea(.top)
  }
}

struct OnboardingToolbar: View {
  var isChatFlowStopped: () -> Bool
  
  var body: some View {
    HStack {
      Image("ThomasCatIcon")
        .resizable()
        .frame(width: 40, height: 40)
        .padding(.horizontal, 7)

      VStack {
        Text("Tutor do Thomas")
          .font(.custom("Barlow-Medium", size: 16))
          .foregroundColor(Color("mainDarkBlue"))
          .frame(maxWidth: .infinity, alignment: .leading)
        
        if !isChatFlowStopped() {
          Text("escrevendo...")
            .font(.custom("Barlow-Medium", size: 12))
            .foregroundColor(Color("mainDarkBlue"))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
    }
    .offset(y: -5)
  }
}

struct OnboardingMainScreen_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingMainScreen()
  }
}
