//
//  DummyNavigation.swift
//  Jarrive
//
//  Created by Ronald on 20/11/23.
//

import SwiftUI


struct DummyNavigation: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("hello").font(.largeTitle)
                
                NavigationLink(destination: StampExerciseView()) {
                    HStack {
                        Text("click me :)")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    DummyNavigation()
}
