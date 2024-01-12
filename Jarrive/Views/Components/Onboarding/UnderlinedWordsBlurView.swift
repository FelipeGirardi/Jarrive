//
//  UnderlinedWordsBlurView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 24/10/23.
//

import SwiftUI

struct UnderlinedWordsBlurView: View {
  @Binding var isBlurViewOn: Bool
  @EnvironmentObject var firestoreManager: FirestoreManager
  
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        
        HStack(spacing: 40) {
          VStack(alignment: .leading, spacing: 40) {
            Text("Palavras sublinhadas\nindicam novas palavras!")
              .font(.custom("Barlow-SemiBold", size: 24))
              .foregroundColor(.white)
            
            Text("Pressione para\naparecer a tradução.")
              .font(.custom("Barlow-SemiBold", size: 16))
              .foregroundColor(.white)
          }
        }
        .frame(height: 200)
        
        Spacer()
        Spacer()
      }
      
      VStack {
        ForEach(1...5, id: \.self) { _ in
          Spacer()
        }
        
        Group {
          VStack(alignment: .leading) {
            MainChatBubbleView(messageData: firestoreManager.onboardingChatMessages[0], currentMessage: .constant(0), optionsClickedIndexes: .constant([]), currentOptionIndex: 0)
              .offset(y: 20)
            
            Image("grayPaw")
              .resizable()
              .frame(width: 60, height: 60)
              .offset(x: 20, y: -20)
          }
          
          Text("OK !")
            .font(.custom("Barlow-SemiBold", size: 16))
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .frame(maxWidth: 300, maxHeight: 50)
            .padding(.horizontal, 30)
            .background(Color("mainLightBlue"))
            .cornerRadius(30)
          //            .padding(.trailing, 30)
          //            .offset(y: 50)
            .onTapGesture {
              isBlurViewOn = false
            }
        }
        .offset(y: 20)
        
        Spacer()
      }
      
      Spacer()
    }
  }
}

struct UnderlinedWordsBlurView_Previews: PreviewProvider {
  static var previews: some View {
    UnderlinedWordsBlurView(isBlurViewOn: .constant(true))
  }
}
