//
//  UnderlinedWordsBlurView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 24/10/23.
//

import SwiftUI

struct UnderlinedWordsBlurView: View {
  @Binding var isBlurViewOn: Bool
  
  var body: some View {
    VStack {
      Spacer()
      
      HStack(spacing: 40) {
        VStack(alignment: .leading, spacing: 40) {
          Text("Palavras sublinhadas\nindicam novas palavras!")
            .font(.custom("Barlow-SemiBoldItalic", size: 15))
            .foregroundColor(.white)
          
          Text("Pressione para\naparecer a tradução.")
            .font(.custom("Barlow-SemiBoldItalic", size: 15))
            .foregroundColor(.white)
          
          Spacer()
        }
        
        VStack {
          Text("Oi?")
            .font(.custom("Barlow-SemiBold", size: 16))
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .frame(maxHeight: 40)
            .padding(.horizontal, 20)
            .background(.white)
            .cornerRadius(30)
          
          Text("Salut?")
            .font(.custom("Barlow-SemiBold", size: 16))
            .underline()
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .frame(maxHeight: 30)
          
          Image("WhitePaw")
            .resizable()
            .frame(width: 60, height: 60)
            .offset(x: 20, y: -20)
          
          Spacer()
        }
      }
      .frame(height: 200)
      
      Spacer()
      
      Text("Ok")
        .font(.custom("Barlow-SemiBold", size: 16))
        .multilineTextAlignment(.leading)
        .foregroundColor(.black)
        .frame(maxHeight: 40)
        .padding(.horizontal, 30)
        .background(.white)
        .cornerRadius(30)
        .onTapGesture {
          isBlurViewOn = false
        }
      
      Spacer()
    }
  }
}

struct UnderlinedWordsBlurView_Previews: PreviewProvider {
  static var previews: some View {
    UnderlinedWordsBlurView(isBlurViewOn: .constant(true))
  }
}
