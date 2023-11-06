//
//  ImageBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 24/10/23.
//

import SwiftUI

struct ImageBubbleView: View {
  var content: ImageBubble
  
  var body: some View {
    HStack {
      Image(content.image)
        .resizable()
        .frame(maxWidth: 145, maxHeight: 145)
        .padding(.leading, 10)
      
      Spacer()
      
    }
  }
}

struct ImageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      ImageBubbleView(content: ImageBubble(image: "ThomasCat"))
    }
}
