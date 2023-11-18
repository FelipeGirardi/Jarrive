//
//  ContentView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import SwiftUI

struct StampsView: View {
  let stampCategories = ["Les mammifères", "Les salutations", "Les couleurs", "Les moyens de transport", "Les lieux de la ville"]
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(searchResults, id: \.self) { result in
          StampView(subject: result)
            .listRowSeparator(.hidden)
        }
      }
      .scrollContentBackground(.hidden)
      .frame(maxWidth: .infinity)
      .edgesIgnoringSafeArea(.horizontal)
      .listStyle(GroupedListStyle())
      .navigationTitle("Selos")
//      .navigationBarTitleDisplayMode(.inline)
    }
    .searchable(text: $searchText)
  }
  
  var searchResults: [String] {
    if searchText.isEmpty {
      return stampCategories
    } else {
      return stampCategories.filter { $0.contains(searchText) }
    }
  }
}

struct StampsView_Previews: PreviewProvider {
  static var previews: some View {
    StampsView()
  }
}
