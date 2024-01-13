//
//  PostcardButtonsView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/12/23.
//

import SwiftUI

struct PostcardButtonsView: View {
  @Binding var shouldShowStampsList: Bool
  var geometry: GeometryProxy
  
  var body: some View {
    HStack(spacing: 10) {
      Button {
        if !shouldShowStampsList {
          shouldShowStampsList.toggle()
        }
      } label: {
        Text("Selos")
          .font(.custom("Barlow-Bold", size: 12))
          .padding()
          .foregroundColor( shouldShowStampsList ? .white : Color("mainDarkBlue"))
          .contentShape(Rectangle())
      }
      .frame(width: geometry.size.width * 0.4, height: 32)
      .background(
        Capsule()
          .foregroundColor( shouldShowStampsList ? Color("mainDarkBlue") : .white)
          .shadow(color: .gray, radius: 2, x: 0, y: 2) )
      
      Button {
        if shouldShowStampsList {
          shouldShowStampsList.toggle()
        }
      } label: {
        Text("Mensagem")
          .font(.custom("Barlow-Bold", size: 12))
          .padding()
          .foregroundColor( shouldShowStampsList ? Color("mainDarkBlue") : .white)
          .contentShape(Rectangle())
      }
      .frame(width: geometry.size.width * 0.4, height: 32)
      .background(
        Capsule()
          .foregroundColor( shouldShowStampsList ? .white : Color("mainDarkBlue"))
          .shadow(color: .gray, radius: 2, x: 0, y: 2) )
    }
    .padding(.all, 10)
    .frame(width: 315)
  }
}
