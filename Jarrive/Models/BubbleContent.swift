//
//  BubbleContent.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import Foundation

enum BubbleUser {
  case cat
  case user
}

struct BubbleString: Hashable {
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
}

enum BubbleContent: Equatable {
  case text(TextBubble?)
  case option(OptionBubble?)
  case response(ResponseBubble?)
  case audio(AudioBubble?)
  case image(ImageBubble?)
}
