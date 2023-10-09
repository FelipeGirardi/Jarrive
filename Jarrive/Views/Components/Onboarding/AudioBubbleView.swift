//
//  AudioBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import SwiftUI

struct AudioBubbleView: View {
  var content: AudioBubble

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct AudioBubbleView_Previews: PreviewProvider {
  static var previews: some View {
    AudioBubbleView(content: AudioBubble(audio: "Salut? Quis est la?"))
  }
}
