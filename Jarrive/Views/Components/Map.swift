//
//  Map.swift
//  Jarrive
//
//  Created by Ronald on 20/12/23.
//

import SwiftUI

struct Map: View {
    var body: some View {
        Group {
            ScrollView([.horizontal, .vertical]) {
                LazyVStack(alignment: .leading, spacing: 1, pinnedViews: [.sectionHeaders, .sectionFooters]) {
                    
                    Image("map")
                        .renderingMode(.original)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Map_Preview: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
