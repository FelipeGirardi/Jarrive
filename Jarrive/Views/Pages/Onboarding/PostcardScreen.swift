//
//  PostcardScreen.swift
//  Jarrive
//
//  Created by Felipe Girardi on 18/11/23.
//

import SwiftUI

struct PostcardScreen: View {
  var postcardData: PostcardData
  @State private var isShowingImage = true
  @State private var animationAmount = 0.0
  let halfAnimationTime = 0.2
  @State private var shouldShowStampsList = true
  @State private var shouldGoToExerciseView = false
  
  func postcardComponent(geometry: GeometryProxy) -> some View {
    VStack(spacing: 0) {
      ZStack {
        Image(postcardData.image)
          .resizable()
          .frame(width: geometry.size.width * 0.86, height: geometry.size.height * 0.3)
          .opacity(isShowingImage ? 1 : 0)
          .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        ZStack {
          Rectangle()
            .foregroundColor(.white)
            .shadow(color: Color("defaultDarkerGray"), radius: 2, x: 0, y: 2)
          
          HStack {
            Spacer()
            
            VStack {
              ZStack(alignment: .bottomTrailing) {
                Text(postcardData.text)
                  .font(.custom("HechoAMano-Regular", size: 16))
                  .foregroundColor(Color("mainBlue"))
                  .lineSpacing(5)
                  .frame(alignment: .leading)
                
                Image("Family")
                  .resizable()
                  .frame(width: 70, height: 80)
                  .offset(x: 20, y: 40)
              }
              .padding(.top, 20)
              
              Spacer()
            }
            
            Spacer()
            
            VStack {
              //   Grid() {
              //       GridRow {
              //           ForEach(postcardData.stamps[0..<2].indices, id: \.self) { index in
              //                   Image("stamp")
              //                       .resizable()
              //                       .frame(width: 36, height: 30)
              //           }
              //       }
              //       GridRow {
              //           ForEach(postcardData.stamps[2..<4], id: \.self) { _ in
              //               Image("stamp")
              //                   .resizable()
              //                   .frame(width: 36, height: 30)
              //           }
              //       }
              //   }
              
              VStack {
                HStack {
                  StampComponent(stamp: postcardData.stamps[0], stampType: .small, geometry: geometry)
                    .frame(width: 50, height: 40)
                  
                  StampComponent(stamp: postcardData.stamps[1], stampType: .small, geometry: geometry)
                    .frame(width: 50, height: 40)
                }
                
                HStack {
                  StampComponent(stamp: postcardData.stamps[2], stampType: .small, geometry: geometry)
                    .frame(width: 50, height: 40)
                  
                  StampComponent(stamp: postcardData.stamps[3], stampType: .small, geometry: geometry)
                    .frame(width: 50, height: 40)
                }
              }
              .padding(.top, 10)
              .padding(.trailing, 10)
              
              Spacer()
            }
          }
        }
        .opacity(isShowingImage ? 0 : 1)
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
      }
      .frame(width: geometry.size.width * 0.86, height: geometry.size.height * 0.3)
      
      HStack {
        Spacer()
        
        HStack(spacing: 5) {
          Image(systemName: "chevron.left")
            .padding()
            .frame(width: 12, height: 22)
            .foregroundColor(Color("mainDarkBlue"))
          
          Text("virar cartão")
            .font(.custom("Barlow-Regular", size: 14))
            .foregroundColor(Color("mainDarkBlue"))
          
          Image(systemName: "chevron.right")
            .padding()
            .frame(width: 12, height: 22)
            .foregroundColor(Color("mainDarkBlue"))
        }
        .padding(.all, 5)
        .padding(.horizontal, 5)
        .background(
          RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .frame(height: 32)
        .padding(.top, 15)
        .onTapGesture {
          DispatchQueue.main.asyncAfter(deadline: .now() + halfAnimationTime) {
            isShowingImage.toggle()
          }
          withAnimation {
            animationAmount += 180
          }
        }
        
        Spacer()
      }
    }
  }
  
  var body: some View {
    NavigationStack {
      GeometryReader { g in
        ZStack {
          VStack {
            Image("OnboardingBG")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(maxWidth: .infinity, maxHeight: 270)
              .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
              .edgesIgnoringSafeArea(.all)
            
            Spacer()
          }
          
          VStack {
            HStack {
              Text(postcardData.author)
                .font(.custom("Barlow-Black", size: 24))
                .foregroundColor(.white)
              
              Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            .padding(.bottom, 10)
            .padding(.leading, 5)
            
            Spacer()
            
            postcardComponent(geometry: g)
              .padding(.horizontal, 30)
              .padding(.top, 20)
            
            Spacer()
            
            PostcardButtonsView(shouldShowStampsList: $shouldShowStampsList, geometry: g)
              .padding(.horizontal, 30)
            
            VStack {
              if shouldShowStampsList {
                StampsListView(stamps: postcardData.stamps, geometry: g, shouldGoToExerciseView: $shouldGoToExerciseView)
              } else {
                PostcardMessageView(postcardData: postcardData, geometry: g)
              }
            }
            .frame(height: g.size.height * 0.31)
            
            Spacer()
            
            HStack {
              Spacer()
              Button {
                print("Voltar para o chat")
              } label: {
                Text("VOLTAR PARA O CHAT")
                  .font(.custom("Barlow-Bold", size: 20))
                  .padding()
                  .foregroundColor(Color("defaultLightGray"))
              }
              .frame(width: g.size.width * 0.86, height: 42)
              .background(
                Capsule()
                  .foregroundColor(Color("defaultLighterGray"))
                  .shadow(color: .gray, radius: 2, x: 0, y: 2))
              Spacer()
            }
            .padding(.top, 10)
            
            Spacer()
          }
        }
        .accentColor(.white)
      }
      .navigationBarHidden(true)
      .navigationDestination(isPresented: $shouldGoToExerciseView) {
        StampExerciseScreen()
      }
    }
  }
}
  
struct PostcardScreen_Previews: PreviewProvider {
  static var previews: some View {
    PostcardScreen(postcardData: OnboardingData().postcardData)
  }
}
