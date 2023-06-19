//
//  MainView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/06/23.
//

import SwiftUI

struct MainView: View {
  @State private var selectedTab = 0
  func setupTabBar() {
    let appearance = UITabBarAppearance()
    appearance.shadowColor = .gray
    appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
    appearance.backgroundColor = UIColor.white
    UITabBar.appearance().scrollEdgeAppearance = appearance
  }

  init() {
    setupTabBar()
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
      TicketsView(ticketVM: TicketViewModel())
        .tabItem {
          ZStack {
            Text("Bilhetes")
          }
        }
        .tag(0)
      
      StampsView()
        .tabItem {
          ZStack {
            Text("Selos")
          }
        }
        .tag(1)
      
      PostcardsView()
        .tabItem {
          ZStack {
            Text("Cartões")
          }
        }
        .tag(2)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
