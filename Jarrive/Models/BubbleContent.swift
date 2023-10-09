//
//  BubbleContent.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import Foundation

struct BubbleString: Hashable {
  var text: String
  var translation: String?
}

struct TextBubble: Hashable {
  var textArray: [BubbleString]
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

enum BubbleContent {
  case text(TextBubble)
  case option(OptionBubble)
  case response(ResponseBubble)
  case audio(AudioBubble)
}
