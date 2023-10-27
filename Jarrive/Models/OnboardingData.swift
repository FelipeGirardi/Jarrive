//
//  OnboardingData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/10/23.
//

import Foundation

struct OnboardingData {
  var catChatMessages = [
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], type: .cat)),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Bonjour", translation: "Bom dia"),  BubbleString(text: "☀️ ou ", translation: nil), BubbleString(text: "bonsoir", translation: "Boa noite"), BubbleString(text: "🌙 ?", translation: nil)], options: ["Bonjour", "Bonsoir"])),
//    User message
//    BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "", translation: nil)], respondedText: "Bonjour ☀️ ? ou bonsoir 🌙 ?")),
    BubbleContent.response(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Bonjour, allors!", translation: "Bom dia, então!")], type: .cat)),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je m'appelle", translation: "Eu me chamo"), BubbleString(text: "Thomas, e você?", translation: nil)], type: .cat)),
//    User message
//    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "", translation: nil)])),
    BubbleContent.text(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Enchanté!", translation: "Encantado"), BubbleString(text: " 😽😽", translation: nil)], type: .cat)),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Human", translation: "Humano"),  BubbleString(text: " ou ", translation: nil), BubbleString(text: "chat", translation: "gato"), BubbleString(text: "?", translation: nil)], options: ["Human 🖖", "Chat 😺"])),
//    User message
//    BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "", translation: nil)], respondedText: "Human ou chat?")),
    BubbleContent.response(nil),
    BubbleContent.audio(AudioBubble(audio: "")),
//    User message
//    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "", translation: nil)])),
    BubbleContent.text(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Você não entendeu?\n", translation: nil), BubbleString(text: "Alors", translation: "Então"), BubbleString(text: ", je suis un chat, mas você não 😑", translation: nil)], type: .cat)),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Além de chat, ", translation: nil), BubbleString(text: "je suis", translation: "eu sou"), BubbleString(text: " carteiro e preciso entregar isso aqui, me ajuda?", translation: nil)], type: .cat)),
    BubbleContent.image(ImageBubble(image: "")),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Você sabe o que é isso?", translation: nil)], options: ["Train 🚂", "Croissant 🥐", "Carte Postale ✉️"])),
//    User message
//    BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "", translation: nil)], respondedText: "Você sabe o que é isso?")),
    BubbleContent.response(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Très bien!", translation: "Muito bem!"), BubbleString(text: "Une carte postale.", translation: "Um cartão postal.")], type: .cat)),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Vamos ler o que tá escrito? 😸😸", translation: nil)], options: ["Oui 👍", "Non 👎"])),
//    User message
//    BubbleContent.response(ResponseBubble(textArray: [BubbleString(text: "", translation: nil)], respondedText: "Vamos ler o que tá escrito? 😸😸")),
    BubbleContent.response(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je suis ", translation: nil), BubbleString(text: "curieux", translation: "curioso"), BubbleString(text: "! 😹", translation: nil)], type: .cat))
  ]
  var pauseMessageFluxIndexes = [1, 4, 7, 9, 14, 17]
}
