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
    HStack {
      HStack(spacing: 15) {
        Image("audioPlay")
          .resizable()
          .frame(width: 30, height: 30)
          .onTapGesture {
            print("Play audio")
          }
        
        Image("audioWaves")
          .resizable()
          .frame(width: 160, height: 20)
      }
      .padding(.all, 15)
      .background(.white)
      .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
      .padding(.leading, 10)
      .padding(.trailing, 50)
      
      Spacer()
    }
  }
  
  struct AudioBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      AudioBubbleView(content: AudioBubble(audio: "Salut? Quis est la?"))
    }
  }
}
