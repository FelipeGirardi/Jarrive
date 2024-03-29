//
//  ContentView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ContentView: View {
  @EnvironmentObject var authViewModel: AuthenticationViewModel
  @State private var isOnboardingDone = UserDefaults.standard.bool(forKey: "isOnboardingDone")
  
  var body: some View {
// MARK: code below checks if user is signed in 
    authViewModel.isLogging ? AnyView(ProgressView()) :
    AnyView(Group {
      Auth.auth().currentUser != nil ? AnyView(BienvenueView()) :
      isOnboardingDone ? AnyView(LoginScreen()) : AnyView(TitleScreen())
      })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
