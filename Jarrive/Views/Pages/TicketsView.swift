//
//  TicketsView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct TicketsView: View {
  let routes = [Route(number: 1, origin: "Ville Saint Meow", destination: "Miaun City"), Route(number: 2, origin: "Miaun City", destination: "Lalaland"), Route(number: 3, origin: "Lalaland", destination: "Ville Obscure"), Route(number: 4, origin: "Ville Obscure", destination: "Mont Saint Chat"), Route(number: 5, origin: "Mont Saint Chat", destination: "Lyon"), Route(number: 6, origin: "Lyon", destination: "Marseille")]
  
  var body: some View {
    NavigationStack {
      ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
          ForEach(routes.indices, id: \.self) { index in
            TicketView(route: routes[index])
              .listRowSeparator(.hidden)
              .frame(height: 135)
          }
          Spacer()
        }
      }
      .scrollContentBackground(.hidden)
      .padding(.horizontal, 50)
      .navigationTitle("Bilhetes")
      .mask(
        VStack(spacing: 0) {
          Rectangle().fill(Color.black)
          
          LinearGradient(gradient:
                          Gradient(
                            colors: [Color.black, Color.black.opacity(0)]),
                         startPoint: .top, endPoint: .bottom
          )
          .frame(height: 50)
        }
      )
    }
  }
}

struct TicketsView_Previews: PreviewProvider {
  static var previews: some View {
    TicketsView()
  }
}
