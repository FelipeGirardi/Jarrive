//
//  OnboardingMainPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 06/10/23.
//

import SwiftUI

struct OnboardingMainPage: View {
  @State var isBlurViewOn: Bool = false

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
          MainChatBubbleView(userType: .cat, content: BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")])))
          
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
            .frame(maxWidth: .infinity, maxHeight: g.size.height * 0.12)
            .padding(.leading, 25)
            .padding(.bottom, 10)
            .background(.white)
            .roundedCorner(10, corners: [.bottomLeft, .bottomRight])
            .ignoresSafeArea()
            
            Spacer()
          }
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
