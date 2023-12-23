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
  @State var onboardingData = OnboardingData()
  @State var textFieldText = ""
  @State var optionsClickedIndexes: [Int] = []
  @State var changeScreenToPostcard = false
  @FocusState private var isFocused: Bool
  
  func isChatFlowStopped() -> Bool {
    return onboardingData.pauseMessageFluxIndexes.contains(currentMessage) ||
    currentMessage == onboardingData.catChatMessages.count - 1
  }
  
  func isTextFieldActive() -> Bool {
    return onboardingData.userTextFieldPauseIndexes.contains(currentMessage)
  }
  
  func shouldChangeScreenToPostcard() -> Bool {
    return currentMessage == onboardingData.catChatMessages.count - 1
  }
  
  func navigationBarView() -> some View {
    VStack {
      VStack {
        Spacer()
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
          
          Spacer()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: 100)
      .padding(.leading, 25)
      .padding(.bottom, 10)
      .background(.white)
      .roundedCorner(10, corners: [.bottomLeft, .bottomRight])
      .ignoresSafeArea()
      
      Spacer()
    }
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
              onboardingData.catChatMessages[currentMessage+1] = BubbleContent.text(TextBubble(textArray: [BubbleString(text: textFieldText)], type: .user))
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
            
            ScrollView {
              VStack(spacing: 10) {
                ForEach(onboardingData.catChatMessages[0 ... currentMessage].indices.reversed(), id: \.self) { index in
                  MainChatBubbleView(content: onboardingData.catChatMessages[0 ... currentMessage][index], onboardingData: $onboardingData, currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes, currentIndex: index)
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
            
            Spacer()
            userTextField
            Spacer()
          }
          .ignoresSafeArea(.keyboard)
          .padding(.bottom, 50)
          .offset(y: isFocused ? -175 : 0)
          
//          navigationBarView()
//            .ignoresSafeArea(.keyboard)
        }
        .brightness(isBlurViewOn ? -0.2 : 0)
        .blur(radius: isBlurViewOn ? 20 : 0)
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
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
      .onChange(of: onboardingData) { _ in
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      }
      .navigationDestination(isPresented: $changeScreenToPostcard) {
        PostcardScreen(postcardData: onboardingData.postcardData)
      }
    }
  }
}

struct OnboardingMainScreen_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingMainScreen()
  }
}
