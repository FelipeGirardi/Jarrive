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
  @State private var shouldGoToExerciceView = false
  @State var shouldShowStampsList = true
  
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
                  Button {
                    print("go to exercice about verbs 1")
                  } label: {
                    NavigationLink(destination: StampExerciseScreen()) {
                      StampComponent(stamp: postcardData.stamps[0], stampType: .small, geometry: geometry)
                        .frame(width: 50, height: 40)
                    }
                  }
                  
                  Button {
                    print("go to exercice about verbs 2")
                  } label: {
                    StampComponent(stamp: postcardData.stamps[1], stampType: .small, geometry: geometry)
                      .frame(width: 50, height: 40)
                  }
                }
                
                HStack {
                  Button {
                    print("go to exercice about substantive")
                  } label: {
                    StampComponent(stamp: postcardData.stamps[2], stampType: .small, geometry: geometry)
                      .frame(width: 50, height: 40)
                  }
                  
                  Button {
                    print("go to exercice about numbers")
                  } label: {
                    StampComponent(stamp: postcardData.stamps[3], stampType: .small, geometry: geometry)
                      .frame(width: 50, height: 40)
                  }
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
    .padding(.bottom, 30)
  }
  
  var body: some View {
    GeometryReader { g in
      NavigationView {
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
//              VStack(alignment: .leading, spacing: 10) {
//                Text("Cartão postal")
//                  .font(.custom("Barlow-Black", size: 16))
//                  .foregroundColor(.white)
                
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
            
            PostcardButtonsView(shouldShowStampsList: $shouldShowStampsList, geometry: g)
              .padding(.horizontal, 30)
            
            Spacer()
            
            VStack {
              if shouldShowStampsList {
                StampsListView(stamps: postcardData.stamps, geometry: g)
              } else {
                PostcardMessageView()
              }
            }
            
            //          VStack(spacing: 50) {
            //            HStack {
            //              Text("Tradução")
            //                .font(.custom("Barlow-SemiBold", size: 16))
            //                .foregroundColor(Color("mainDarkBlue"))
            //                .frame(alignment: .leading)
            //
            //              Spacer()
            //            }
            //
            //            HStack {
            //              Text(postcardData.translation)
            //                .font(.custom("Barlow-Italic", size: 14))
            //                .foregroundColor(Color("mainDarkBlue"))
            //                .lineSpacing(5)
            //                .padding(.leading, 20)
            //                .frame(maxWidth: 230, alignment: .leading)
            //
            //              Spacer()
            //            }
            //          }
            
            Spacer()
            //          Spacer()
          }
//          .padding(.horizontal, 30)
        }
      }
      .accentColor(.white)
    }
  }
}

struct PostcardScreen_Previews: PreviewProvider {
  static var previews: some View {
    PostcardScreen(postcardData: OnboardingData().postcardData)
  }
}

struct StampComponent: View {
  var stamp: StampData
  var stampType: StampType
  var geometry: GeometryProxy
  
  func isStampSmall() -> Bool {
    return stampType == .small
  }
  
  func isCurrentStamp() -> Bool {
    return stamp.title == "Être"
  }
  
  var body: some View {
    return ZStack {
      Image(isCurrentStamp() ? "Stamp4" : "Stamp2")
        .resizable()
        .frame(width: isStampSmall() ? 50 : geometry.size.width * 0.51, height: isStampSmall() ? 40 : geometry.size.height * 0.21)
        .shadow(color: isCurrentStamp() ? Color("defaultDarkerGray") : .white, radius: 2)
      
      HStack {
        VStack(alignment: .leading) {
          VStack(alignment: .leading, spacing: 0) {
            Text(stamp.group)
              .font(.custom("Barlow-Regular", size: isStampSmall() ? 5 : 20))
              .minimumScaleFactor(0.5)
              .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            
            Text("#00" + String(stamp.number))
              .font(.custom("Barlow-Regular", size: isStampSmall() ? 5 : 20))
              .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
          }
          .padding(.top, isStampSmall() ? 5 : 20)
          
          Spacer()
          
          
          Text(stamp.title)
            .font(.custom(isStampSmall() ? "Barlow-Bold" : "Barlow-Black", size: isStampSmall() ? 8 : 24))
            .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            .padding(.bottom, isStampSmall() ? 5 : 26)
        }
        .padding(.leading, isStampSmall() ? 7 : 26)
        
        Spacer()
      }
    }
  }
}

struct PostcardButtonsView: View {
  @Binding var shouldShowStampsList: Bool
  var geometry: GeometryProxy
  
  var body: some View {
    HStack(spacing: 10) {
      Button {
          if !shouldShowStampsList {
            shouldShowStampsList.toggle()
          }
      } label: {
          Text("Selos")
              .font(.custom("Barlow-Bold", size: 12))
              .padding()
              .foregroundColor( shouldShowStampsList ? .white : Color("mainDarkBlue"))
      }
      .frame(width: geometry.size.width * 0.4, height: 32)
      .background(
          Capsule()
            .foregroundColor( shouldShowStampsList ? Color("mainDarkBlue") : .white )
              .shadow(color: .gray, radius: 2, x: 0, y: 2) )
        
      Button {
          if shouldShowStampsList {
            shouldShowStampsList.toggle()
          }
      } label: {
          Text("Mensagem")
              .font(.custom("Barlow-Bold", size: 12))
              .padding()
              .foregroundColor( shouldShowStampsList ? Color("mainDarkBlue") : .white )
      }
      .frame(width: geometry.size.width * 0.4, height: 32)
      .background(
          Capsule()
              .foregroundColor( shouldShowStampsList ? .white : Color("mainDarkBlue"))
              .shadow(color: .gray, radius: 2, x: 0, y: 2) )
    }
    .padding(.all, 10)
    .frame(width: 315)
  }
}

struct StampsListView: View {
  var stamps: [StampData]
  var geometry: GeometryProxy

  var body: some View {
    return VStack(alignment: .leading, spacing: 23) {
      Text("Faltam 3 selos para enviar o cartão postal!")
        .font(.custom("Barlow-SemiBold", size: 16))
        .foregroundColor(Color("mainDarkBlue"))
        .padding(.horizontal, 30)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 30) {
          ForEach(stamps.indices, id: \.self) { index in
            StampComponent(stamp: stamps[index], stampType: .large, geometry: geometry)
              .padding(.trailing, (index == stamps.count-1) ? 60 : 0)
          }
        }
        .frame(height: geometry.size.height * 0.22)
        .offset(x: 30)
      }
      
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
        .frame(width: geometry.size.width * 0.86, height: 42)
        .background(
          Capsule()
            .foregroundColor(Color("defaultLighterGray"))
            .shadow(color: .gray, radius: 2, x: 0, y: 2))
        Spacer()
      }
    }
  }
}

struct PostcardMessageView: View {
  var body: some View {
    return Group {}
  }
}
