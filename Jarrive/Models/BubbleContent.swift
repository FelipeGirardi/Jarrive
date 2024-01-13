//
//  BubbleContent.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import Foundation
import FirebaseFirestoreSwift

enum BubbleUser {
  case cat
  case user
}

struct BubbleString: Hashable, Codable {
  var text: String
  var translation: String?
}

struct TextBubble: Hashable {
  var textArray: [BubbleString]
  var type: BubbleUser
}

struct OptionBubble: Hashable {
  var textArray: [BubbleString]
  var options: [String]
}

struct ResponseBubble: Hashable {
  var textArray: [BubbleString]
  var respondedText: String
}

struct AudioBubble: Hashable {
  var audio: String
}

struct ImageBubble: Hashable {
  var image: String
  var largeImage: String
}

struct StickerBubble: Hashable {
  var sticker: String
}

enum BubbleContent: Equatable, Hashable {
  case text(TextBubble?)
  case option(OptionBubble?)
  case response(ResponseBubble?)
  case audio(AudioBubble?)
  case image(ImageBubble?)
}

// Main chat message struct
struct MessageData: Equatable, Hashable, Codable {
  var id: Int?
  var type: String?
  var user: String?
  var textArray: [BubbleString]?
  var options: [String]?
  var respondedText: String?
  var audio: String?
  var image: String?
  var largeImage: String?
  var sticker: String?
}
