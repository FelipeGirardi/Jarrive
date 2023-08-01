//
//  JarriveApp.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import Firebase
import SwiftUI

@main
struct JarriveApp: App {
  @StateObject var authViewModel = AuthenticationViewModel()

  init() {
    setupAuthentication()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(authViewModel)
    }
  }
}

extension JarriveApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}

