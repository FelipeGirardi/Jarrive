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
            Text(postcardData.text)
              .font(.custom("Bilbo-Regular", size: 14))
              .foregroundColor(Color("mainDarkBlue"))
              .lineSpacing(5)
              .frame(alignment: .leading)
            Spacer()
            
            VDashedLine()
              .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
              .frame(width: 1, height: 180)
            Spacer()
            
            VStack(spacing: 20) {
              Grid() {
                GridRow {
                  ForEach(postcardData.stamps[0..<2], id: \.self) { _ in
                    Image("stamp")
                      .resizable()
                      .frame(width: 36, height: 30)
                  }
                }
                GridRow {
                  ForEach(postcardData.stamps[2..<4], id: \.self) { _ in
                    Image("stamp")
                      .resizable()
                      .frame(width: 36, height: 30)
                  }
                }
              }
              
              VStack(spacing: 0) {
                Text("__________")
                  .fontWeight(.light)
                Text("__________")
                  .fontWeight(.light)
                Text("__________")
                  .fontWeight(.light)
              }
              .padding(.horizontal, 10)
            }
            
            Spacer()
          }
        }
        .opacity(isShowingImage ? 0 : 1)
        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
      }
      .frame(width: 315, height: 215)

      HStack {
        Spacer()
        
        Image("DoubleArrow")
          .padding()
          .frame(width: 56, height: 32)
          .background(Color("mainLightBlue"))
          .clipShape(Capsule())
          .padding(.trailing, 25)
          .offset(y: -10)
          .onTapGesture {
            DispatchQueue.main.asyncAfter(deadline: .now() + halfAnimationTime) {
              isShowingImage.toggle()
            }
            withAnimation {
              animationAmount += 180
            }
          }
      }
    }
    .padding(.bottom, 30)
  }
  
  var body: some View {
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
              .font(.custom("Barlow-SemiBold", size: 16))
              .foregroundColor(.white)
            
            Text(postcardData.author)
              .font(.custom("Barlow-SemiBold", size: 24))
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
}

struct PostcardScreen_Previews: PreviewProvider {
  static var previews: some View {
    PostcardScreen(postcardData: PostcardData(author: "Thierry", image: "CatsAndTrain", text: "Bonsoir! Je voyage à Francosphère la semaine prochaine! Je suis content!\n\nBises", translation: "Boa noite! Eu viajo para Francosphère na semana que vem! Eu estou contente!\n\nBeijos", stamps: [StampData(group: "verbos", number: 1, title: "Appeler"), StampData(group: "verbos", number: 2, title: "Être"), StampData(group: "substantivos", number: 1, title: "Pessoas"), StampData(group: "números", number: 1, title: "1 a 10")]))
  }
}
