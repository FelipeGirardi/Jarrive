//
//  StampComponent.swift
//  Jarrive
//
//  Created by Felipe Girardi on 15/12/23.
//

import SwiftUI

struct StampComponent: View {
  var stamp: StampData
  var stampType: StampType
  var geometry: GeometryProxy
  
  func isStampSmall() -> Bool {
    return stampType == .small
  }
  
  func isCurrentStamp() -> Bool {
    return stamp.title == "Être"
  }
  
  var body: some View {
    return ZStack {
      Image(isCurrentStamp() ? "Stamp4" : "Stamp2")
        .resizable()
        .frame(width: isStampSmall() ? 50 : geometry.size.width * 0.51, height: isStampSmall() ? 40 : geometry.size.height * 0.21)
        .shadow(color: isCurrentStamp() ? Color("defaultDarkerGray") : .white, radius: 2)
      
      HStack {
        VStack(alignment: .leading) {
          VStack(alignment: .leading, spacing: 0) {
            Text(stamp.group)
              .font(.custom("Barlow-Regular", size: isStampSmall() ? 5 : 20))
              .minimumScaleFactor(0.5)
              .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            
            Text("#00" + String(stamp.number))
              .font(.custom("Barlow-Regular", size: isStampSmall() ? 5 : 20))
              .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
          }
          .padding(.top, isStampSmall() ? 5 : 20)
          
          Spacer()
          
          
          Text(stamp.title)
            .font(.custom(isStampSmall() ? "Barlow-Bold" : "Barlow-Black", size: isStampSmall() ? 8 : 24))
            .foregroundColor(isCurrentStamp() ? Color("mainDarkBlue") : Color("defaultDarkGray"))
            .padding(.bottom, isStampSmall() ? 5 : 26)
        }
        .padding(.leading, isStampSmall() ? 7 : 26)
        
        Spacer()
      }
    }
  }
}
