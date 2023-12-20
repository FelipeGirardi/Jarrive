//
//  EcoutePhraseView.swift
//  Jarrive
//
//  Created by Ronald on 20/12/23.
//

import AVFoundation
import SwiftUI

struct EcoutePhraseView: View {
    var audio: String
    var phrase: String
    @State var audioPlayer: AVAudioPlayer?
    @State var isPlayingAudio: Bool = false
    @State var wasPlayed: Bool = false
    @State var audioPlayedCount: CGFloat = 0.0
    @Binding var progress: CGFloat
    @Binding var shouldReviseEcouteExercice: Bool
    
    func createAudioPlayer(audio: String) {
        if let sound = Bundle.main.path(forResource: audio, ofType: "mp3") {
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
            wasPlayed = true
        }
    }
    
    var body: some View {
        // Title
        if phrase == "On écoute les phrases!" {
            HStack {
                Button {
                    createAudioPlayer(audio: audio)
                    playOrPause()

                } label: {
                    Image(wasPlayed ? "audioPlayed" : "audioPlayerExercices")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
                .frame(width: 42, height: 42)
                
                Text("On écoute les phrases!")
                    .font(.custom("Barlow-SemiBold", size: 20))
                    .underline()
            }.foregroundStyle(.white).padding(.bottom, 10)
        } else {
            // Exercicies
            HStack(alignment: .center) {
                Button {
                    if !wasPlayed {
                        createAudioPlayer(audio: audio)
                        playOrPause()
                        self.progress = progress + 0.25
                        
                        if self.progress == 1 {
                                withAnimation {
                                shouldReviseEcouteExercice.toggle()
                            }
                        }
                    }
                } label: {
                    Image(wasPlayed ? "audioPlayed" : "audioPlayerExercices")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 35, height: 35)
                
                Text(phrase)
                    .font(.custom("Barlow-Regular", size: 20))
            }
        }
    }
}
struct EcoutePhraseView_Preview: PreviewProvider {
    static var previews: some View {
        EcoutePhraseView(audio: "CatMeow", phrase: "", progress: .constant(0.0), shouldReviseEcouteExercice: .constant(false))
    }
}
