//
//  ContentView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
    TitleScreen()
//    switch viewModel.authState {
//      case .signedIn: MainTabView()
//      case .signedOut: LoginScreen()
//    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
