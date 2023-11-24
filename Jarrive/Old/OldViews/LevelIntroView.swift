//
//  LevelIntroView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct LevelIntroView: View {
  var routeNumber: Int
  var station: Station
  
  let columns = [
    GridItem(.adaptive(minimum: 162, maximum: 252)),
    GridItem(.adaptive(minimum: 162, maximum: 252))
  ]
  
  var body: some View {
    NavigationStack {
      VStack {
        ZStack {
          Rectangle()
            .fill(Color("defaultLighterGray"))
          
          VStack(spacing: 10) {
            HStack {
              BackButton(label: "← Route \(routeNumber)")
              
              Spacer()
            }
            .padding(.top, 12)
            
            Spacer()
            
            VStack(spacing: 5) {
              Text("Gare")
                .font(.system(size: 15))
              
              Text(station.name)
                .font(.system(size: 24))
                .fontWeight(.bold)
            }
            .padding(.bottom, 12)
          }
        }
        .frame(height: 122)
        
        Spacer()
        
        LazyVGrid(columns: columns) {
          ForEach(station.postcards, id: \.self) { card in
            Image(card.image)
          }
        }
        
        Spacer()
      }
      .navigationBarTitle("")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct LevelIntroView_Previews: PreviewProvider {
  static var previews: some View {
    LevelIntroView(routeNumber: 1, station: Station(name: "Ville Saint Meow", postcards: [Postcard(author: "Mathilde", image: "grassParkLarge", stamp: "stamp", content: "Chère personne"), Postcard(author: "Mathilde", image: "catOnFlowersLarge", stamp: "stamp", content: "Chère personne qui a perdu son manteau rouge,\nJe suis Mathilde, la personne qui a trouvé votre manteau de taille M abandonné dans ce café. En l'inspectant, j'ai découvert 25 euros dans la poche, une note de caisse et une bague.\nJe comprends combien ces objets peuvent être importants pour vous, et je tiens à les rendre en personne. Je vous invite donc à me contacter à l'adresse suivante:\nMathilde Dupont 12\nRue des Lilas 75000"), Postcard(author: "Mathilde", image: "mountainVillageLarge", stamp: "stamp", content: "Chère personne"), Postcard(author: "Mathilde", image: "dogOnBeachLarge", stamp: "stamp", content: "Chère personne")]))
  }
}
