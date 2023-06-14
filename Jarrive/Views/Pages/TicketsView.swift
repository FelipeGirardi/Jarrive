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
          }
        }
      }
      .scrollContentBackground(.hidden)
      .padding(.horizontal, 50)
      .navigationTitle("Bilhetes")
    }
  }
}

struct TicketsView_Previews: PreviewProvider {
  static var previews: some View {
    TicketsView()
  }
}
