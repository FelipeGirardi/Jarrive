//
//  MainTabView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/06/23.
//

import Firebase
import SwiftUI
import GoogleSignIn

struct MainTabView: View {
  @State private var selectedTab = 0
  @EnvironmentObject var authViewModel: AuthenticationViewModel
  private let user = GIDSignIn.sharedInstance.currentUser
  // NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
  // Text(user?.profile?.name ?? "")
  // Text(user?.profile?.email ?? "")

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

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
