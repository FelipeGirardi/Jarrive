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
  
  var body: some View {
      HStack {
        Image(messageData.image!)
            .resizable()
            .frame(maxWidth: 145, maxHeight: 145)
            .padding(.leading, 10)
            .onTapGesture {
              // since it's the only image that user can download, condition is ok for now
              if messageData.image == "catOnTrainSmall" {
                changeToFullscreenImage.toggle()
              }
            }
        
        Spacer()
        
      }
      .navigationDestination(isPresented: $changeToFullscreenImage) {
        FullScreenImageScreen(imageString: messageData.largeImage!)
      }
  }
}

struct ImageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      ImageBubbleView(messageData: MessageData(type: "image", image: "catOnTrainSmall", largeImage: "catOnTrainLarge"))
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
