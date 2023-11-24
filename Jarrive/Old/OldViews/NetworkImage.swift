//
//  NetworkImage.swift
//  Jarrive
//
//  Created by Felipe Girardi on 28/06/23.
//

import SwiftUI

struct NetworkImage: View {
  let url: URL?
  
  var body: some View {
    if let url = url,
       let data = try? Data(contentsOf: url),
       let uiImage = UIImage(data: data) {
      Image(uiImage: uiImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
    } else {
      Image(systemName: "person.circle.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
  }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
      NetworkImage(url: URL(string: ""))
    }
}
