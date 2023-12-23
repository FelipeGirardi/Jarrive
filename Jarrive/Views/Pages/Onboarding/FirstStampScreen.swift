//
//  FirstStampScreen.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/12/23.
//

import SwiftUI

struct FirstStampScreen: View {
  var body: some View {
    NavigationStack {
      GeometryReader { g in
        VStack {
          Spacer()
          
          Text("Você resgatou seu\nprimeiro selo!")
            .font(.custom("Barlow-Bold", size: 30))
            .foregroundColor(Color("mainBlue"))
            .multilineTextAlignment(.center)
          
          Spacer()
          
          HStack(spacing: 10) {
            Image("greenCheck")
              .resizable()
              .frame(width: 24, height: 24)
            
            Text("Completou as tarefas do selo Être!")
              .font(.custom("Barlow-SemiBold", size: 18))
              .foregroundColor(.white)
          }
          .frame(width: g.size.width * 0.84, height: 30)
          .padding(10)
          .background(
            RoundedRectangle(
              cornerRadius: 30,
              style: .continuous
            )
            .fill(Color("mainBlue"))
          )
          
          Spacer()
          
          ZStack {
            HStack {
              Image("bgStampTiltedLeft")
                .resizable()
                .frame(width: 96, height: 96)
                .offset(x: -40, y: -25)
              
              Image("bgStampTiltedRight")
                .resizable()
                .frame(width: 96, height: 96)
                .offset(x: 50, y: 50)
            }
            
            ZStack {
              Image("redStamp")
                .resizable()
              
              HStack {
                VStack(alignment: .leading) {
                  VStack(alignment: .leading, spacing: 0) {
                    Text("verbes")
                      .font(.custom("Barlow-SemiBold", size: 22))
                      .foregroundColor(.white)
                      .minimumScaleFactor(0.5)
                    
                    Text("#001")
                      .font(.custom("Barlow-SemiBold", size: 22))
                      .foregroundColor(.white)
                  }
                  .padding(.top, 30)
                  
                  Spacer()
                  
                  Text("Être")
                    .font(.custom("Barlow-Black", size: 32))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                }
                .padding(.leading, 30)
                .rotationEffect(.degrees(-7.5))
                
                Spacer()
              }
            }
            .frame(width: 198, height: 163)
          }
          
          Spacer()
          
          ZStack {
            VStack(alignment: .center, spacing: 20) {
              VStack(alignment: .leading, spacing: 30) {
                Text("Sua coleção de selos começou!\nComplete sua coleção!")
                  .font(.custom("Barlow-ExtraBold", size: 20))
                  .foregroundColor(.white)
                  .multilineTextAlignment(.leading)
                
                Text("Selos são lições rápidas para auxiliar\nno seu aprendizado da língua francesa.")
                  .font(.custom("Barlow-Medium", size: 16))
                  .foregroundColor(.white)
                  .multilineTextAlignment(.leading)
                
                Text("Faça o login para realizar as próximas lições!")
                  .font(.custom("Barlow-Bold", size: 15))
                  .foregroundColor(.white)
                  .multilineTextAlignment(.leading)
              }
              
              Button(action: {
                print("Ir para tela de login")
              }) {
                NavigationLink(destination: Map().navigationBarHidden(true)) {
                  Text("FAZER LOGIN")
                    .font(.custom("Barlow-Bold", size: 20))
                    .frame(width: g.size.width * 0.86, height: 20)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(
                      RoundedRectangle(
                        cornerRadius: 30,
                        style: .continuous
                      )
                      .fill(Color("mainGreen"))
                    )
                }.navigationBarBackButtonHidden(true)

              }
              
              Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: g.size.height * 0.38)
            .padding(.top, 30)
            .background(Color("mainBlue"))
            .roundedCorner(30, corners: [.topLeft, .topRight])
            .offset(y: 35)
          }
          .edgesIgnoringSafeArea(.bottom)
        }
        .frame(maxWidth: .infinity)
      }
    }
  }
}

#Preview {
  FirstStampScreen()
}
