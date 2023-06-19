//
//  TicketView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct TicketView: View {
  var route: Binding<Route>
  @EnvironmentObject var ticketVM: TicketViewModel
  
  func backgroundView() -> some View {
    return Group {
      route.wrappedValue.number == 1 ? AnyView(EmptyView()) :
      ticketVM.routes[route.wrappedValue.number-2].isExpanded ? AnyView(EmptyView()) :
      (route.wrappedValue.number % 2 != 0 ? AnyView(Color("defaultDarkGray")) : AnyView(Color("defaultLightGray")))
    }
  }
  
  var body: some View {
    GeometryReader { proxy in
      VStack(spacing: 0) {
        ZStack {
          backgroundView()
          
          RoundedRectangle(cornerRadius: 13)
            .fill(route.wrappedValue.number % 2 != 0 ? Color("defaultLightGray") : Color("defaultDarkGray"))
          
          VStack {
            Spacer()
            
            VStack(spacing: 0) {
              Text("Route 0\(route.wrappedValue.number)")
              Text("\(route.wrappedValue.origin) - \(route.wrappedValue.destination)")
            }
            
            HDashedLine()
              .stroke(style: StrokeStyle(lineWidth: 1, dash: [2]))
              .frame(width: proxy.size.width, height: 1)
          }
        }
        .frame(height: 117)

        ZStack {
          route.wrappedValue.isExpanded ?
          route.wrappedValue.number == 1 ? AnyView(EmptyView()) : AnyView(
            Rectangle()
              .fill(route.wrappedValue.number % 2 != 0 ? Color("defaultDarkGray") : Color("defaultLightGray"))
              .roundedCorner(13, corners: [.bottomLeft, .bottomRight])
          ) : AnyView(backgroundView())
          
          Group {
            route.wrappedValue.number % 2 != 0 ? Color("defaultLightGray") : Color("defaultDarkGray")
          }
          .roundedCorner(13, corners: [.topLeft, .topRight])
          .roundedCorner(route.wrappedValue.isExpanded ? 13 : 0, corners: [.bottomLeft, .bottomRight])
        }
      }
      .onTapGesture {
        withAnimation(.easeOut) {
          ticketVM.animateExpand(route: route)
        }
      }
    }
  }
}

struct TicketView_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReader { g in
      TicketView(route: .constant(Route(number: 2, origin: "Ville Saint Meow", destination: "Miaun City", isExpanded: false))).environmentObject(TicketViewModel())
    }
  }
}
