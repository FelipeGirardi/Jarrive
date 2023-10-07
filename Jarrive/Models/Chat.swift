//
//  Chat.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/10/23.
//

import Foundation

struct TextBubble: Hashable {
  var text: String
}

struct OptionBubble: Hashable {
  var text: String
  var options: [String]
}

struct ResponseBubble: Hashable {
  var response: String
  var text: String
}

struct AudioBubble: Hashable {
  var audio: String
}

enum StringOrInt {
    case txt(TextBubble)
    case opt(OptionBubble)
}
