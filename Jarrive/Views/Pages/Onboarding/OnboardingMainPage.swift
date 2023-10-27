//
//  OnboardingMainPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 06/10/23.
//

import SwiftUI

struct OnboardingMainPage: View {
  @State var isBlurViewOn: Bool = false
  @State var currentMessage: Int = 4
  @State var messagesTimer: Int = 3
  let onboardingData = OnboardingData()
  
  func navigationBarView(g: GeometryProxy) -> some View {
    VStack {
      VStack {
        Spacer()
        HStack {
          Image("ThomasCatIcon")
            .resizable()
            .frame(width: 40, height: 40)
            .padding(.horizontal, 7)
          
          VStack {
            Text("Issa - Le tuteur de Thomas")
              .font(.custom("Barlow-Medium", size: 16))
              .foregroundColor(Color("mainDarkBlue"))
              .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("en écrivant...")
              .font(.custom("Barlow-Medium", size: 12))
              .foregroundColor(Color("mainDarkBlue"))
              .frame(maxWidth: .infinity, alignment: .leading)
          }
          
          Spacer()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: g.size.height * 0.1)
      .padding(.leading, 25)
      .padding(.bottom, 10)
      .background(.white)
      .roundedCorner(10, corners: [.bottomLeft, .bottomRight])
      .ignoresSafeArea()
      
      Spacer()
    }
  }
  
  var body: some View {
    GeometryReader { g in
      ZStack {
        Group {
          Image("OnboardingBG")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
          
          // Messages view
          VStack {
            Spacer()
            
            VStack(spacing: 10) {
              ForEach(0...currentMessage, id: \.self) { i in
                MainChatBubbleView(userType: .cat, content: onboardingData.catChatMessages[i])
              }
            }
            
            // Text Field for sending messages
          }
          .padding(.bottom, g.size.height * 0.15)
          
          navigationBarView(g: g)
        }
        .brightness(isBlurViewOn ? -0.2 : 0)
        .blur(radius: isBlurViewOn ? 20 : 0)
        
        if isBlurViewOn {
          UnderlinedWordsBlurView(isBlurViewOn: $isBlurViewOn)
        }
        
      }
    }
  }
}

struct OnboardingMainPage_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingMainPage()
  }
}
