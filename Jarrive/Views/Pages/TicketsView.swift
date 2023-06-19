//
//  TicketsView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct TicketsView: View {
  @StateObject var ticketVM: TicketViewModel
  
  var body: some View {
    NavigationStack {
      ScrollViewReader { scrollView in
        ScrollView(showsIndicators: false) {
          VStack(spacing: 0) {
            ForEach($ticketVM.routes, id: \.wrappedValue.number) { r in
              VStack {
                TicketView(route: r)
                  .environmentObject(ticketVM)
                  .listRowSeparator(.hidden)
                  .frame(height: r.wrappedValue.isExpanded ? 546 : 135)
                
                r.wrappedValue.isExpanded ? AnyView(Spacer(minLength: 20)) : AnyView(EmptyView())
              }
//              .onTapGesture { _ in
//                withAnimation {
//                  print(r.wrappedValue.number-1)
//                  scrollView.scrollTo(r.wrappedValue.number-1, anchor: .center)
//                }
//              }
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
}

struct TicketsView_Previews: PreviewProvider {
  static var previews: some View {
    TicketsView(ticketVM: TicketViewModel())
  }
}
