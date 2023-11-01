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
            
            Text("escrevendo...")
              .font(.custom("Barlow-Medium", size: 12))
              .foregroundColor(Color("mainDarkBlue"))
              .frame(maxWidth: .infinity, alignment: .leading)
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
  
  var body: some View {
//    GeometryReader { g in
      ZStack {
        Group {
          Image("OnboardingBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
          
          // Messages view
//          ScrollView {
              VStack {
                Spacer()
                
                VStack(spacing: 10) {
                  ForEach(0...currentMessage, id: \.self) { i in
                    withAnimation {
                      MainChatBubbleView(content: onboardingData.catChatMessages[i], onboardingData: $onboardingData, currentMessage: $currentMessage)
                    }
                  }
                }
                
                // Text Field for sending messages
              }
              .padding(.bottom, 100)
//              .frame(maxHeight: .infinity)
//              .edgesIgnoringSafeArea(.top)
//              .frame(minHeight: UIScreen.main.bounds.height)
//          }
//          .frame(width: UIScreen.main.bounds.width)
//          .edgesIgnoringSafeArea(.all)
          
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
          
          if onboardingData.pauseMessageFluxIndexes.contains(currentMessage) {
            timer.upstream.connect().cancel()
//            onboardingData.catChatMessages[currentMessage+1] = BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "Bonjour", translation: nil)], respondedText: "Bonjour ☀️ ? ou bonsoir 🌙 ?"))
          }
        }
      }
      .onChange(of: onboardingData) { _ in
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
      }
//    }
  }
}

struct OnboardingMainPage_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingMainPage()
  }
}
