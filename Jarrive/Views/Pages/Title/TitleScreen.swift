//
//  TitleScreen.swift
//  Jarrive
//
//  Created by Felipe Girardi on 05/10/23.
//

import SwiftUI

struct TitleScreen: View {
  @State var goToOnboarding: Bool = false
  
  var body: some View {
    goToOnboarding ? AnyView(OnboardingMainScreen()) :
    AnyView(GeometryReader { g in
      ZStack {
        Image("TitleScreen")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(minWidth: 0, maxWidth: .infinity)
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          ForEach(0...3, id: \.self) { _ in
            Spacer()
          }
          
          TitleScreenMenu(geometry: g, goToOnboarding: $goToOnboarding)
            .frame(width: g.size.width * 0.83, height: g.size.height * 0.33)
          
          Spacer()
        }
      }
    })
  }
}

struct TitleScreenMenu: View {
  var geometry: GeometryProxy
  @Binding var goToOnboarding: Bool
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(.ultraThinMaterial)
        .padding()
      
      VStack {
        Spacer()
        
        Text("Primeira vez aqui?")
          .font(.custom("Barlow-Bold", size: 24))
          .foregroundColor(.white)
          .padding(.bottom, 20)
        
        Text("Sim, quero pegar o trem!")
            .onTapGesture {
              goToOnboarding = !goToOnboarding
            }
            .font(.custom("Barlow-Bold", size: 16))
            .frame(width: geometry.size.width * 0.6, height: 30)
            .padding(10)
            .foregroundColor(.white)
            .background(
              RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
              )
              .fill(Color("mainBlue"))
            )
            .padding(.vertical, 10)
        
        
        Text("Não, retomar minha aventura!")
          .onTapGesture {
            print("Login")
          }
          .font(.custom("Barlow-Bold", size: 16))
          .frame(width: geometry.size.width * 0.6, height: 30)
          .padding(10)
          .foregroundColor(Color("mainBlue"))
          .background(
            RoundedRectangle(
              cornerRadius: 10,
              style: .continuous
            )
            .fill(.white)
          )
        
        Spacer()
      }
    }
  }
}

struct TitleScreen_Previews: PreviewProvider {
  static var previews: some View {
    TitleScreen()
  }
}
