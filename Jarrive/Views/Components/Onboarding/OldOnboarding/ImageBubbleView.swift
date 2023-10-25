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
          .frame(width: 145, height: 145)
      }
      
      Spacer()
    }
}

struct ImageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      ImageBubbleView(content: ImageBubble(image: "ThomasCat"))
    }
}
