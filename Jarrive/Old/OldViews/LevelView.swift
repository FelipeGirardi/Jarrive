//
//  LevelView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct LevelView: View {
  var stationName: String
  var postcard: Postcard
  @State private var isShowingContent = true
  @State private var animationAmount = 0.0
  let halfAnimationTime = 0.2
  
  var body: some View {
    GeometryReader { proxy in
      NavigationStack {
        VStack {
          ZStack {
            Rectangle()
              .fill(Color("defaultLighterGray"))
            
            VStack(spacing: 10) {
              HStack {
                BackButton(label: "← Gare")
                
                Spacer()
              }
              .padding(.top, 12)
              
              Spacer()
              
              HStack {
                Spacer()
                
                ArrowButton(label: "←")
                
                Spacer()
                
                VStack(spacing: 5) {
                  Text("Carte de:")
                    .font(.system(size: 15))
                  
                  Text(postcard.author)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                }
                .padding(.bottom, 12)
                
                Spacer()
                
                ArrowButton(label: "→")
                
                Spacer()
              }
            }
          }
          .frame(height: 122)
          
          ZStack {
            Image(postcard.image)
              .resizable()
              .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.26)
              .rotationEffect(.degrees(180))
              .opacity(isShowingContent ? 0 : 1)
              .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
              
            ZStack {
              Rectangle()
                .foregroundColor(Color("defaultLightGray"))
                .shadow(color: Color("defaultDarkerGray"), radius: 2, x: 0, y: 2)

              HStack {
                Spacer()
                Text(postcard.content)
                  .italic()
                  .minimumScaleFactor(0.01)
                  .padding(.all, 20)
                Spacer()
                VDashedLine()
                  .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
                  .frame(width: 1, height: proxy.size.height * 0.2)
                Spacer()
                VStack {
                  Image("stamp")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 20))

                  Spacer()
                }
                Spacer()
              }
            }
            .opacity(isShowingContent ? 1 : 0)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
          }
          .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.26)
          .padding(.vertical, 20)
          .onTapGesture {
            DispatchQueue.main.asyncAfter(deadline: .now() + halfAnimationTime) {
              isShowingContent.toggle()
            }
            withAnimation {
              animationAmount += 180
            }
          }
          
          ScrollView(showsIndicators: false) {
            Text(postcard.content)
              .font(.custom("Barlow-LightItalic", size: 20))
              .italic()
              .lineLimit(nil)
              .frame(width: proxy.size.width * 0.8)
          }
          .mask(
              VStack(spacing: 0) {
                  LinearGradient(gradient:
                     Gradient(
                         colors: [Color.black.opacity(0), Color.black]),
                         startPoint: .top, endPoint: .bottom
                     )
                     .frame(height: 30)

                  Rectangle().fill(Color.black)

                  LinearGradient(gradient:
                     Gradient(
                         colors: [Color.black, Color.black.opacity(0)]),
                         startPoint: .top, endPoint: .bottom
                     )
                  .frame(height: 30)
              }
           )
        }
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}

struct LevelView_Previews: PreviewProvider {
  static var previews: some View {
    LevelView(stationName: "Mont de Saint Chat", postcard: Postcard(author: "Mathilde", image: "catOnFlowers", stamp: "stamp", content: "Chère personne qui a perdu son manteau rouge,\n\nJe suis Mathilde, la personne qui a trouvé votre manteau de taille M abandonné dans ce café. En l'inspectant, j'ai découvert 25 euros dans la poche, une note de caisse et une bague.\n\nJe comprends combien ces objets peuvent être importants pour vous, et je tiens à les rendre en personne. Je vous invite donc à me contacter à l'adresse suivante:\n\nMathilde Dupont 12\n\nRue des Lilas 75000"))
  }
}
