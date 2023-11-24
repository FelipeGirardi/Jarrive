//
//  PlayAudioButton.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

struct PlayAudioButton: View {
  var body: some View {
    Button(action: {
      print("Play audio")
    }) {
      Text("")
        .frame(width: 26, height: 26)
        .background(Color("defaultLightGray"))
        .cornerRadius(2)
        .clipShape(Circle())
    }
  }
}

struct PlayAudioButton_Previews: PreviewProvider {
  static var previews: some View {
    PlayAudioButton()
  }
}
