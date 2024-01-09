//
//  StickerBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 09/01/24.
//

import SwiftUI

struct StickerBubbleView: View {
  var messageData: MessageData
  
  var body: some View {
    HStack {
      Image(messageData.sticker!)
        .resizable()
        .frame(width: 100, height: 100)
        .padding(.leading, 50)
      
      Spacer()
    }
  }
}

#Preview {
  StickerBubbleView(messageData: MessageData(type: "sticker", sticker: "smilingCat"))
}
