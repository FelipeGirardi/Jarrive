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
  
  func stampComponent(stamp: StampData) -> some View {
    ZStack {
      Image(stamp.title == "Être" ? "Stamp1" : "Stamp2")
        .resizable()
        .frame(width: 50, height: 40)
      
      HStack {
        VStack(alignment: .leading) {
          VStack(alignment: .leading, spacing: 0) {
            Text(stamp.group)
              .font(.custom("Barlow-Regular", size: 5))
              .foregroundColor(stamp.title == "Être" ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            
            Text("#00" + String(stamp.number))
              .font(.custom("Barlow-Regular", size: 5))
              .foregroundColor(stamp.title == "Être" ? Color("mainDarkBlue") : Color("defaultDarkGray"))
          }
          .padding(.top, 5)
          
          Spacer()
          
          
          Text(stamp.title)
            .font(.custom("Barlow-Bold", size: 8))
            .foregroundColor(stamp.title == "Être" ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            .padding(.bottom, 5)
        }
        .padding(.leading, 7)
        
        Spacer()
      }
    }
    .frame(width: 50, height: 40)
  }
  
  var postcardComponent: some View {
    VStack(spacing: 0) {
      ZStack {
        Image(postcardData.image)
          .resizable()
          .frame(width: 315, height: 215)
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
                  .foregroundColor(Color("mainDarkBlue"))
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
                      stampComponent(stamp: postcardData.stamps[0])
                    }
                  }
                  
                  Button {
                    print("go to exercice about verbs 2")
                  } label: {
                    stampComponent(stamp: postcardData.stamps[1])
                  }
                }
                
                HStack {
                  Button {
                    print("go to exercice about substantive")
                  } label: {
                    stampComponent(stamp: postcardData.stamps[2])
                  }
                  
                  Button {
                    print("go to exercice about numbers")
                  } label: {
                    stampComponent(stamp: postcardData.stamps[3])
                  }
                }
              }
              .padding(.top, 10)
              .padding(.trailing, 10)
              
              Spacer()
            }
            
//            Spacer()
          }
        }
        .opacity(isShowingImage ? 0 : 1)
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
      }
      .frame(width: 315, height: 215)
      
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
        .padding(.all, 10)
        .background(
          RoundedRectangle(cornerRadius: 25)
              .fill(Color.white)
              .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
        .offset(y: 12)
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
            VStack(alignment: .leading, spacing: 10) {
              Text("Cartão postal")
                .font(.custom("Barlow-Black", size: 16))
                .foregroundColor(.white)
              
              Text(postcardData.author)
                .font(.custom("Barlow-Black", size: 24))
                .foregroundColor(.white)
            }
            Spacer()
          }
          .padding(.top, 10)
          
          Spacer()
          
          postcardComponent
          
          VStack(spacing: 50) {
            HStack {
              Text("Tradução")
                .font(.custom("Barlow-SemiBold", size: 16))
                .foregroundColor(Color("mainDarkBlue"))
                .frame(alignment: .leading)
              
              Spacer()
            }
            
            HStack {
              Text(postcardData.translation)
                .font(.custom("Barlow-Italic", size: 14))
                .foregroundColor(Color("mainDarkBlue"))
                .lineSpacing(5)
                .padding(.leading, 20)
                .frame(maxWidth: 230, alignment: .leading)
              
              Spacer()
            }
          }
          
          Spacer()
          Spacer()
        }
        .padding(.horizontal, 30)
      }
    }
    .accentColor(.white)
  }
}

struct PostcardScreen_Previews: PreviewProvider {
  static var previews: some View {
    PostcardScreen(postcardData: OnboardingData().postcardData)
  }
}
