//
//  StampsListView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/12/23.
//

import SwiftUI

struct StampsListView: View {
  var stamps: [StampData]
  var geometry: GeometryProxy
  @Binding var shouldGoToExerciseView: Bool
  
  var body: some View {
    return VStack(alignment: .leading, spacing: 23) {
      Text("Faltam 3 selos para enviar o cartão postal!")
        .font(.custom("Barlow-SemiBold", size: 16))
        .foregroundColor(Color("mainDarkBlue"))
        .padding(.horizontal, 30)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 30) {
          ForEach(stamps.indices, id: \.self) { index in
            StampComponent(stamp: stamps[index], stampType: .large, geometry: geometry)
              .padding(.trailing, (index == stamps.count-1) ? 60 : 0)
              .onTapGesture {
                if (index == 0) {
                  shouldGoToExerciseView.toggle()
                }
              }
          }
        }
        .frame(height: geometry.size.height * 0.22)
        .offset(x: 30)
      }
    }
  }
}
