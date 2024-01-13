//
//  AnimationIntro.swift
//  Jarrive
//
//  Created by Ronald on 12/01/24.
//

import AVFoundation
import AVKit
import Combine
import Foundation
import SwiftUI


struct AVPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.showsPlaybackControls = false
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
        return playerController
    }
}

class PlayerViewModel : ObservableObject {
    @Published var videoDone = false
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "intro", ofType: "mp4")!))
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
            .sink { (_) in
                self.videoDone = true
                print("Video done")
                DispatchQueue.main.async {
                    self.videoDone = false //reset it on the next run loop
                }
            }.store(in: &cancellables)
    }
}

struct PlayerContentView: View {
    
    @ObservedObject var viewModel = PlayerViewModel()
    @State var isVideoPlayed = false

    var body: some View {
        ZStack {
            AVPlayerView(player: viewModel.player)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewModel.player.play()
                }
                .onDisappear {
                    viewModel.player.pause()
                    viewModel.player.seek(to: .zero)
                }
                .onTapGesture {
                    viewModel.videoDone = true
                    
                }
        }
        .background(Color(.black))
        .edgesIgnoringSafeArea(.all)
        .onReceive(viewModel.$videoDone) { videoDone in
            if videoDone {
                isVideoPlayed = true
            }
        }
        .navigate(to: OnboardingMainScreen(), when: $isVideoPlayed, navBarHidden: true)
    }
}

struct ContentViewPlayer: View {
    var body: some View {
        NavigationView {
            PlayerContentView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

// next view: OnboardingMainScreen
