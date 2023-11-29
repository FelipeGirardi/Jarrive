//
//  AudioBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/10/23.
//

import AVFoundation
import SwiftUI

struct AudioBubbleView: View {
  var content: AudioBubble
  @State var audioPlayer: AVAudioPlayer?
  @State var isPlayingAudio: Bool = false
  
  func createAudioPlayer() {
    if let sound = Bundle.main.path(forResource: "CatMeow", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }
  
  func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlayingAudio = false
    } else {
      player.play()
      isPlayingAudio = true
    }
  }
  
  var body: some View {
    HStack {
      HStack(spacing: 15) {
        Image("audioPlay")
          .resizable()
          .frame(width: 30, height: 30)
          .onTapGesture {
            playOrPause()
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
    .onAppear {
      createAudioPlayer()
    }
  }
  
  struct AudioBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      AudioBubbleView(content: AudioBubble(audio: "CatMeow"))
    }
  }
}
