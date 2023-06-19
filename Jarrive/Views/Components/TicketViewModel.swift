//
//  TicketViewModel.swift
//  Jarrive
//
//  Created by Felipe Girardi on 19/06/23.
//

import Foundation
import SwiftUI

class TicketViewModel: ObservableObject {
  
  @Published var routes: [Route] = [Route(number: 1, origin: "Ville Saint Meow", destination: "Miaun City", isExpanded: false), Route(number: 2, origin: "Miaun City", destination: "Lalaland", isExpanded: false), Route(number: 3, origin: "Lalaland", destination: "Ville Obscure", isExpanded: false), Route(number: 4, origin: "Ville Obscure", destination: "Mont Saint Chat", isExpanded: false), Route(number: 5, origin: "Mont Saint Chat", destination: "Lyon", isExpanded: false), Route(number: 6, origin: "Lyon", destination: "Marseille", isExpanded: false), Route(number: 7, origin: "Ville Saint Meow", destination: "Miaun City", isExpanded: false), Route(number: 8, origin: "Miaun City", destination: "Lalaland", isExpanded: false), Route(number: 9, origin: "Lalaland", destination: "Ville Obscure", isExpanded: false), Route(number: 10, origin: "Ville Obscure", destination: "Mont Saint Chat", isExpanded: false), Route(number: 11, origin: "Mont Saint Chat", destination: "Lyon", isExpanded: false), Route(number: 12, origin: "Lyon", destination: "Marseille", isExpanded: false)]
  
  func animateExpand(route: Binding<Route>) {
    route.wrappedValue.isExpanded.toggle()
  }
}
