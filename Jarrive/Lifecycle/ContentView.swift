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
    
// MARK: code below checks if user is signed in 
//    viewModel.isLogging ? AnyView(ProgressView()) :
//    AnyView(Group {
//      switch viewModel.authState {
//      case .signedIn: TitleScreen()
//      case .signedOut: LoginScreen().onAppear { viewModel.checkIfSignedInGoogle() }
//      }
//    }
//    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
