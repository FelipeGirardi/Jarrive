//
//  StampView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct StampView: View {
  var subject: String
  let words = ["word1", "word2", "word3", "word4", "word5"]
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 13)
        .fill(Color("stampLightGray"))
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          VStack {
            Text(subject)
              .font(.system(size: 12))
              .frame(width: 100)
              .multilineTextAlignment(.leading)
              .lineLimit(nil)
            Spacer()
          }
          Spacer()
          ForEach(words, id: \.self) { _ in
            Image("stamp")
              .frame(width: 102, height: 102)
          }
        }
        .padding(.vertical, 15)
        .padding(.leading, 10)
      }
    }
    .frame(height: 135)
  }
}

struct StampView_Previews: PreviewProvider {
  static var previews: some View {
    StampView(subject: "Les mammifères")
  }
}
