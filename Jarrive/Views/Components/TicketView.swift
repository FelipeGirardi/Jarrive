//
//  TicketView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct TicketView: View {
  var route: Route
  
  func backgroundView() -> some View {
    return Group {
      route.number == 1 ? AnyView(EmptyView()) :
      (route.number % 2 != 0 ? AnyView(Color("defaultDarkGray")) : AnyView(Color("defaultLightGray")))
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      VStack(spacing: 0) {
        ZStack {
          backgroundView()
          
          RoundedRectangle(cornerRadius: 13)
            .fill(route.number % 2 != 0 ? Color("defaultLightGray") : Color("defaultDarkGray"))
          
          VStack {
            Spacer()
            
            VStack(spacing: 0) {
              Text("Route 0\(route.number)")
              Text("\(route.origin) - \(route.destination)")
            }
            
            HDashedLine()
              .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
              .frame(width: proxy.size.width, height: 1)
          }
        }
        .frame(height: 117)
        
        ZStack {
          backgroundView()
          
          Group {
            route.number % 2 != 0 ? Color("defaultLightGray") : Color("defaultDarkGray")
          }
          .roundedCorner(13, corners: [.topLeft, .topRight])
        }
      }
      .frame(idealHeight: 135)
    }
  }
}

struct TicketView_Previews: PreviewProvider {
  static var previews: some View {
    TicketView(route: Route(number: 2, origin: "Ville Saint Meow", destination: "Miaun City"))
  }
}
