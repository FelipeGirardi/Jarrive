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
          .frame(width: proxy.size.width * 0.75, height: proxy.size.height * 0.26)
          .padding(.vertical, 20)
          
          ScrollView(showsIndicators: false) {
            Text(postcard.content)
              .font(.system(size: 20))
              .italic()
              .lineLimit(nil)
              .frame(width: proxy.size.width * 0.8)
          }
        }
        .navigationBarTitle("")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
  }
}

struct LevelView_Previews: PreviewProvider {
  static var previews: some View {
    LevelView(stationName: "Mont de Saint Chat", postcard: Postcard(author: "Mathilde", image: "catOnFlowersLarge", stamp: "stamp", content: "Chère personne qui a perdu son manteau rouge,\n\nJe suis Mathilde, la personne qui a trouvé votre manteau de taille M abandonné dans ce café. En l'inspectant, j'ai découvert 25 euros dans la poche, une note de caisse et une bague.\n\nJe comprends combien ces objets peuvent être importants pour vous, et je tiens à les rendre en personne. Je vous invite donc à me contacter à l'adresse suivante:\n\nMathilde Dupont 12\n\nRue des Lilas 75000"))
  }
}
