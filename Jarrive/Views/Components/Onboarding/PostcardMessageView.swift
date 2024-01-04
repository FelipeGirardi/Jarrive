//
//  PostcardMessageView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/12/23.
//

import SwiftUI

struct PostcardMessageView: View {
  var postcardData: PostcardData
  var geometry: GeometryProxy
  
  var body: some View {
    return Group {
      HStack {
        VStack(alignment: .leading, spacing: 15) {
          HStack(alignment: .center, spacing: 8) {
            Image("audioButton")
              .resizable()
              .frame(width: 32, height: 32)
              .onTapGesture {
                print("Play audio")
              }
            
            Text("Escute a mensagem!")
              .font(.custom("Barlow-SemiBold", size: 16))
              .foregroundColor(Color("mainDarkBlue"))
              .padding(.bottom, 5)
          }
          .padding(.top, 15)
          
          Text(postcardData.text!.replacingOccurrences(of: "\\n", with: "\n"))
            .font(.custom("Barlow-italic", size: 16))
            .foregroundColor(Color("defaultDarkerGray"))
            .minimumScaleFactor(0.1)
            .lineSpacing(5)
            .padding(.leading, 5)
          
          Spacer()
        }
        Spacer()
      }
      .padding(.leading, 14)
    }
    .frame(width: geometry.size.width * 0.87, height: geometry.size.height * 0.31)
    .background(Color("defaultLighterGray"))
    .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
    
  }
}
