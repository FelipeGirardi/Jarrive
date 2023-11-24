//
//  PostcardsView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct PostcardsView: View {
  let images = ["mountainVillage", "catOnFlowers", "grassPark", "dogOnBeach", "mountainVillage", "catOnFlowers", "grassPark", "dogOnBeach", "mountainVillage", "catOnFlowers", "grassPark", "dogOnBeach", "mountainVillage", "catOnFlowers", "grassPark", "dogOnBeach", "mountainVillage", "catOnFlowers", "grassPark", "dogOnBeach"]
  let columns = [
          GridItem(.fixed(90)),
          GridItem(.fixed(90)),
          GridItem(.fixed(90)),
          GridItem(.fixed(90))
      ]
  
  var body: some View {
    NavigationStack {
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: columns, spacing: 2) {
          ForEach(images.indices, id: \.self) { index in
            Image(images[index])
          }
        }
      }
      .navigationTitle("Cartões")
//      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct PostcardsView_Previews: PreviewProvider {
  static var previews: some View {
    PostcardsView()
  }
}
