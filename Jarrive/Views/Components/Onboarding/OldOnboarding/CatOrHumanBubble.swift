//
//  CatOrHumanBubble.swift
//  Jarrive
//
//  Created by Felipe Girardi on 20/08/23.
//

import SwiftUI

struct CatOrHumanBubble: View {
  @Binding var choice: CatOrHuman
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Spacer()
        
        ZStack {
          Image("chatBubble4")
            .resizable()
            .frame(width: 233, height: 100)
          
          HStack {
            VStack {
              ZStack {
                RoundButton()
                  .onTapGesture {
                    choice = .cat
                  }
                RoundedRectangle(cornerRadius: 70)
                  .frame(width: 20, height: 20)
                  .foregroundColor(choice == .cat ? Color("mainBlue") : Color.white)
              }
              Text("Chat")
                .font(.custom("BasicSans-Regular", size: 16))
                .foregroundColor(Color("mainBlue"))
            }
            .padding(.trailing, 20)

            VStack {
              ZStack {
                RoundButton()
                  .onTapGesture {
                    choice = .human
                  }
                RoundedRectangle(cornerRadius: 70)
                  .frame(width: 20, height: 20)
                  .foregroundColor(choice == .human ? Color("mainBlue") : Color.white)
              }
              Text("Human")
                .font(.custom("BasicSans-Regular", size: 16))
                .foregroundColor(Color("mainBlue"))
            }
            .padding(.leading, 20)
          }
          .padding(.bottom, 10)
        }
        .padding(.trailing, 32)
      }
      
      HStack {
        Spacer()
        Text("...")
          .font(.custom("BasicSans-Black", size: 24))
          .foregroundColor(Color("mainBlue"))
          .padding(.trailing, 22)
      }
    }
  }
}

struct CatOrHumanBubble_Previews: PreviewProvider {
  static var previews: some View {
    CatOrHumanBubble(choice: .constant(.human))
  }
}
