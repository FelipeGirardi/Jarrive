//
//  ImageBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 24/10/23.
//

import SwiftUI

struct ImageBubbleView: View {
  var messageData: MessageData
  @State var changeToFullscreenImage = false
  @State var showTranslations: Bool = false
  
  var getBubbleText: some View {
    var fullString = Text("")
    let punctuations = ",.!?:;()"
    
    if let textArray = messageData.textArray {
      for (index, str) in textArray.enumerated() {
        fullString = fullString +
        Text(str.text.replacingOccurrences(of: "\\n", with: "\n"))
          .underline(str.translation != nil)
        // check if should remove space in case of punctuation
        fullString = fullString + (textArray.indices.contains(index+1) ? (punctuations.contains(textArray[index+1].text.first!) ? Text("") : Text(" ")) : Text(" "))
      }
    }
    
    return fullString
  }
  
  var body: some View {
    ZStack(alignment: .center) {
        HStack {
          VStack(spacing: 0) {
            Image(messageData.image!)
              .resizable()
              .frame(width: messageData.textArray != nil ? 220 : 150, height: messageData.textArray != nil ? 220 : 150)
              .padding(.all, 2)
              .onTapGesture {
                // since it's the only image that user can download, condition is ok for now
                if messageData.image == "catOnTrainSmall" {
                  changeToFullscreenImage.toggle()
                }
              }
            
            if messageData.textArray != nil {
              getBubbleText
                .font(.custom("Barlow-Medium", size: 16))
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.5)
                .baselineOffset(2)
                .foregroundColor(Color("mainDarkBlue"))
                .padding(.all, 8)
            }
          }
          .background(.white)
          .roundedCorner(20, corners: [.topRight, .bottomLeft, .bottomRight])
          .frame(maxWidth: messageData.textArray != nil ? 220 : 150, maxHeight: messageData.textArray != nil ? 300 : 150)
          .padding(.leading, 10)
          .onTapGesture {
            showTranslations.toggle()
          }
          .navigationDestination(isPresented: $changeToFullscreenImage) {
            FullScreenImageScreen(imageString: messageData.largeImage!)
          }
          
          Spacer()
        }
      
      if messageData.textArray != nil {
        HStack {
          TranslationBubbleView(translations: messageData.textArray!.filter({$0.translation != nil}))
            .opacity(showTranslations ? 1 : 0)
            .padding(.leading, 10)
            .onTapGesture {
              showTranslations.toggle()
            }
          
          Spacer()
        }
      }
    }
  }
}

struct ImageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      ImageBubbleView(messageData: MessageData(type: "image", textArray: [BubbleString(text: "Bonjour", translation: "Bom dia"), BubbleString(text: " ou ", translation: ""), BubbleString(text: "Bonsoir", translation: "Boa noite")], image: "catOnTrainSmall", largeImage: "catOnTrainLarge"))
    }
}

struct FullScreenImageScreen: View {
  var imageString: String
  @State var showImageDownloadAlert = false
  @Environment(\.dismiss) var dismiss
  
  var imgView: Image {
    Image(imageString)
  }
  
  var body: some View {
    ZStack {
      imgView
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//          .offset(y: 25)
    }
    .navigationBarBackButtonHidden()
    .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.backward")
                    Text("Issa - Le tuteur de Thomas")
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              let image = imgView.asUiImage()
              UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
              showImageDownloadAlert.toggle()
            } label: {
                Image("DownloadButton")
                  .frame(width: 32, height: 32)
                  .padding(.trailing, 5)
                  .padding(.top, 5)
            }
        }
    }
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(.white, for: .navigationBar)
    .alert("Imagem baixada com sucesso!", isPresented: $showImageDownloadAlert) {
                Button("OK", role: .cancel) { }
            }
  }
}
