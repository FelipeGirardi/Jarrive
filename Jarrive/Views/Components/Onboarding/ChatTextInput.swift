//
//  ChatTextInput.swift
//  Jarrive
//
//  Created by Felipe Girardi on 04/08/23.
//

import SwiftUI

struct ChatTextInput: View {
  let inputLimit = 30
  @Binding var nameInput: String
  @Binding var textFieldDisabled: Bool
  
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Spacer()
        
        ZStack {
          Image("chatBubble4")
            .resizable()
            .frame(width: 233, height: 100)
          
          TextField("Nom", text: $nameInput, axis: .vertical)
            .lineLimit(2, reservesSpace: true)
            .font(.custom("BasicSans-Regular", size: 16))
            .foregroundColor(Color("mainBlue"))
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 25, trailing: 10))
            .frame(width: 233, height: 100)
            .lineSpacing(5)
            .disabled(textFieldDisabled)
            .overlay(
              VStack {
                Divider()
                  .frame(height: 1)
                  .background(Color("mainBlue"))
                  .offset(y: -12)
                  .padding(.horizontal, 10)
              }
            )
            .overlay(
              VStack {
                Divider()
                  .frame(height: 1)
                  .background(Color("mainBlue"))
                  .offset(y: 12)
                  .padding(.horizontal, 10)
              }
            )
            .onChange(of: nameInput) { _ in
              nameInput = String(nameInput.prefix(inputLimit))
            }
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

struct ChatTextInput_Previews: PreviewProvider {
  static var previews: some View {
    ChatTextInput(nameInput: .constant(""), textFieldDisabled: .constant(false))
  }
}
