//
//  Character.swift
//  Jarrive
//
//  Created by Ronald on 02/12/23.
//

import Foundation

struct Character: Identifiable, Hashable, Equatable {
    var id = UUID().uuidString
    var sentence: [String]
    var value: String
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 18
    var isShowing: Bool = false
}

var characters_Mock: [Character] = [
    Character(sentence: ["Je", "un facteur. ✉️"], value: "suis"),
    Character(sentence: ["Tu", "mon copain. ❤️"], value: "es"),
    Character(sentence: ["Elle", "dans un train. 🚂"], value: "est"),
    Character(sentence: ["Nous", "en voyage. ✈️"], value: "sommes"),
]
