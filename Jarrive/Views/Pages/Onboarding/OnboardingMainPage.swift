//
//  OnboardingMainPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 06/10/23.
//

import SwiftUI

struct OnboardingMainPage: View {
  @State var isBlurViewOn: Bool = false
  @State var currentMessage: Int = 0
  @State var messagesTimer: Int = 2
  @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State var onboardingData = OnboardingData()
  @State var textFieldText = ""
  @State var optionsClickedIndexes: [Int] = []
  
  func isChatFlowStopped() -> Bool {
    return onboardingData.pauseMessageFluxIndexes.contains(currentMessage) ||
    currentMessage == onboardingData.catChatMessages.count - 1
  }
  
  func isTextFieldActive() -> Bool {
    return onboardingData.userTextFieldPauseIndexes.contains(currentMessage)
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
      TextField(isTextFieldActive() ? "Digite..." : "", text: $textFieldText)
        .disabled(!isTextFieldActive())
      
      ZStack {
        RoundedRectangle(cornerRadius: 30)
          .frame(width: 45, height: 45)
          .foregroundColor(Color("mainLightBlue"))

        Image(systemName: "arrowtriangle.right.fill")
          .foregroundColor(.white)
          .onTapGesture {
            if isTextFieldActive() {
              onboardingData.catChatMessages[currentMessage+1] = BubbleContent.text(TextBubble(textArray: [BubbleString(text: textFieldText)], type: .user))
              textFieldText = ""
              currentMessage += 1
              timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            }
          }
      }
      
    }
    .textFieldStyle(OvalTextFieldStyle())
    .padding(.horizontal, 10)
  }
  
  var body: some View {
      ZStack {
        Group {
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
                      withAnimation {
                        MainChatBubbleView(content: onboardingData.catChatMessages[0 ... currentMessage][index], onboardingData: $onboardingData, currentMessage: $currentMessage, optionsClickedIndexes: $optionsClickedIndexes, currentIndex: index)
                          .rotationEffect(Angle(radians: .pi)) // rotate each item
                          .scaleEffect(x: -1, y: 1, anchor: .center)
                          .fixedSize(horizontal: false, vertical: true)
                      }
                    }
                  }
                }
                .rotationEffect(Angle(radians: .pi)) // rotate the whole ScrollView 180º
                .scaleEffect(x: -1, y: 1, anchor: .center)
                .padding(.bottom, 15)
                .padding(.top, 80)
                
                userTextField
              }
              .padding(.bottom, 50)
          
          navigationBarView()
        }
        .brightness(isBlurViewOn ? -0.2 : 0)
        .blur(radius: isBlurViewOn ? 20 : 0)
        
        if isBlurViewOn {
          UnderlinedWordsBlurView(isBlurViewOn: $isBlurViewOn)
        }
        
      }
      .onReceive(timer) { _ in
        if messagesTimer > 0 {
          messagesTimer -= 1
        } else {
          messagesTimer = 3
          currentMessage += 1
          
          if currentMessage == 1 {
            isBlurViewOn.toggle()
          }
          
          if isChatFlowStopped() {
            timer.upstream.connect().cancel()
          }
        }
      }
      .onChange(of: onboardingData) { _ in
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      }
  }
}

struct OnboardingMainPage_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingMainPage()
  }
}
