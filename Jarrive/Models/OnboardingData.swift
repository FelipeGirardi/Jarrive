//
//  OnboardingData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/10/23.
//

import Foundation

struct OnboardingData {
  var catChatMessages = [
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")])),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Bonjour", translation: "Bom dia"),  BubbleString(text: "☀️ ou ", translation: nil), BubbleString(text: "bonsoir", translation: "Boa noite"), BubbleString(text: "🌙?", translation: nil)], options: ["Bonjour", "Bonsoir"])),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Bonjour, allors!", translation: "Bom dia, então!")])),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je m'appelle", translation: "Eu me chamo"), BubbleString(text: "Thomas, e você?", translation: nil)]))
  ]
}
