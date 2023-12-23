//
//  ContentView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
    TitleScreen()
    
// MARK: code below checks if user is signed in 
//    viewModel.isLogging ? AnyView(ProgressView()) :
//    AnyView(Group {
//      Auth.auth().currentUser != nil ? AnyView(TitleScreen()) : AnyView(LoginScreen())
//      })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
