//
//  InitialConversationPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

enum AnimationState {
  case bonjour
  case jeMappelle
}

struct InitialChatPage: View {
  @State var animationState: AnimationState = .bonjour
  @State var goToNewScreen: Bool = false

  var bonjourText: some View {
    HStack {
      Spacer()
      Spacer()

      ZStack {
        Image("chatBubble1")
          .frame(width: 170, height: 80)
        Text("Bonjour!")
          .font(.custom("BasicSans-Regular", size: 36))
          .foregroundColor(Color("mainBlue"))
          .offset(y: -10)
      }
      .padding(.horizontal, 10)
      
      PlayAudioButton()
      PlayAudioButton()
      
      Spacer()
    }
  }
  
  var jeMappelleText: some View {
    HStack {
      Spacer()
      Spacer()

      ZStack {
        Image("chatBubble2")
          .frame(width: 170, height: 80)
        Text("Je m'appelle Thomas.")
          .font(.custom("BasicSans-Regular", size: 36))
          .foregroundColor(Color("mainBlue"))
          .offset(y: -10)
      }
      .padding(.horizontal, 20)
      
      PlayAudioButton()
      PlayAudioButton()
      
      Spacer()
    }
    .padding(.top, 20)
  }
  
  var suivantButton: some View {
    HStack {
      Spacer()
      Spacer()

      SuivantButton()
        .onTapGesture {
          withAnimation {
            switch animationState {
            case .bonjour:
              animationState = .jeMappelle
            case .jeMappelle:
              goToNewScreen.toggle()
            }
          }
        }
        .padding(.horizontal, 10)
      
      PlayAudioButton()
      PlayAudioButton()
      
      Spacer()
    }
  }
  
  var body: some View {
    VStack {
      goToNewScreen ? AnyView(ChatPage()) :
      AnyView(VStack {
        Spacer()
        
        VStack {
          bonjourText
            .opacity(animationState == .jeMappelle ? 0.3 : 1)
          
          animationState == .jeMappelle ? AnyView(jeMappelleText) : AnyView(EmptyView())
        }
        
        Image("ThomasCat")
          .frame(width: 215, height: 276)
        
        Spacer()
        
        suivantButton
        
        Spacer()
      })
    }
  }
}

struct InitialChatPage_Previews: PreviewProvider {
  static var previews: some View {
    InitialChatPage()
  }
}
