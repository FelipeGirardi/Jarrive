//
//  ChatPage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 01/08/23.
//

import SwiftUI

struct ChatPage: View {
  var suivantButton: some View {
    HStack {
      Spacer()
      Spacer()

      SuivantButton()
        .onTapGesture {
          
        }
        .padding(.horizontal, 10)
      
      PlayAudioButton()
      PlayAudioButton()
      
      Spacer()
    }
  }
  
  var body: some View {
    VStack {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      
      suivantButton
    }
  }
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
