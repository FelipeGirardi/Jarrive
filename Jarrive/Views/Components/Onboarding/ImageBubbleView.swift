//
//  ImageBubbleView.swift
//  Jarrive
//
//  Created by Felipe Girardi on 24/10/23.
//

import SwiftUI

struct ImageBubbleView: View {
  var content: ImageBubble
  @State var changeToFullscreenImage = false
  
  var body: some View {
//    NavigationView {
      HStack {
          Image(content.image)
            .resizable()
            .frame(maxWidth: 145, maxHeight: 145)
            .padding(.leading, 10)
            .onTapGesture {
              // since it's the only image that user can download, condition is ok for now
              if content.image == "catOnTrainSmall" {
                changeToFullscreenImage.toggle()
              }
            }
        
        Spacer()
        
      }
      .navigationDestination(isPresented: $changeToFullscreenImage) {
        FullScreenImageScreen(imageString: content.largeImage)
      }
  }
}

struct ImageBubbleView_Previews: PreviewProvider {
    static var previews: some View {
      ImageBubbleView(content: ImageBubble(image: "catOnTrainSmall", largeImage: "catOnTrainLarge"))
    }
}

struct FullScreenImageScreen: View {
  var imageString: String
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
          .offset(y: 25)
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
            } label: {
                Image("DownloadButton")
                  .frame(width: 32, height: 32)
                  .padding(.trailing, 5)
                  .padding(.top, 5)
            }
        }
    }
//    .edgesIgnoringSafeArea(.all)
  }
}

extension View {
    func asUiImage() -> UIImage {
        var uiImage = UIImage(systemName: "exclamationmark.triangle.fill")!
        let controller = UIHostingController(rootView: self)
       
        if let view = controller.view {
            let contentSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: contentSize)
            view.backgroundColor = .clear

            let renderer = UIGraphicsImageRenderer(size: contentSize)
            uiImage = renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
        return uiImage
    }
}
