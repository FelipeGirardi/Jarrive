//
//  OnboardingData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/10/23.
//

import Foundation

struct OnboardingData: Equatable {
  static func == (lhs: OnboardingData, rhs: OnboardingData) -> Bool {
    return lhs.catChatMessages == rhs.catChatMessages
  }
  
  var catChatMessages = [
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Salut? Quis est la?", translation: "Oi? Quem é?")], type: .cat)),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Bonjour", translation: "Bom dia"),  BubbleString(text: "☀️ ou ", translation: nil), BubbleString(text: "bonsoir", translation: "Boa noite"), BubbleString(text: "🌙 ?", translation: nil)], options: ["Bonjour", "Bonsoir"])),
//    User message - option choice
    BubbleContent.response(nil),
    BubbleContent.text(nil),
    BubbleContent.image(ImageBubble(image: "catOnTrainSmall", largeImage: "catOnTrainLarge")),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je m'appelle", translation: "Eu me chamo"), BubbleString(text: "Thomas, e você?", translation: nil)], type: .cat)),
//    User message - text
    BubbleContent.text(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Enchanté!", translation: "Encantado"), BubbleString(text: " 😽😽", translation: nil)], type: .cat)),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Human", translation: "Humano"),  BubbleString(text: " ou ", translation: nil), BubbleString(text: "chat", translation: "gato"), BubbleString(text: "?", translation: nil)], options: ["Human 🖖", "Chat 😺"])),
//    User message - option choice
    BubbleContent.response(nil),
    BubbleContent.audio(AudioBubble(audio: "")),
//    User message - text
    BubbleContent.text(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Você não entendeu?\n", translation: nil), BubbleString(text: "Alors", translation: "Então"), BubbleString(text: ", je suis un chat, mas você não 😑", translation: nil)], type: .cat)),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Além de chat, ", translation: nil), BubbleString(text: "je suis", translation: "eu sou"), BubbleString(text: " carteiro e preciso entregar isso aqui, me ajuda?", translation: nil)], type: .cat)),
    BubbleContent.image(ImageBubble(image: "CatPostcard", largeImage: "CatPostcard")),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Você sabe o que é isso?", translation: nil)], options: ["Train 🚂", "Croissant 🥐", "Carte Postale ✉️"])),
//    User message - option choice
    BubbleContent.response(nil),
    BubbleContent.text(nil),
    BubbleContent.option(OptionBubble(textArray: [BubbleString(text: "Vamos ler o que está escrito?", translation: nil)], options: ["Oui 👍", "Non 👎"])),
//    User message - option choice
    BubbleContent.response(nil),
    BubbleContent.text(TextBubble(textArray: [BubbleString(text: "Je suis ", translation: nil), BubbleString(text: "curieux", translation: "curioso"), BubbleString(text: "! 😹", translation: nil)], type: .cat))
  ]
  let pauseMessageFluxIndexes = [1, 5, 8, 10, 15, 18]
  let userTextFieldPauseIndexes = [5, 10]
  let optionPauseIndexes = [1, 8, 15, 18]
  let variableOptionMessageIndexes = [1, 15]
  let variableOptionFollowingMessages = [[MessageData(id: 3, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, allors!", translation: "Bom dia, então!")]), MessageData(id: 3, type: "text", user: "cat", textArray: [BubbleString(text: "Bonsoir, allors!", translation: "Boa noite, então!")])], [MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Non...", translation: "Não..."), BubbleString(text: "C'est une carte postale.", translation: "É um cartão postal.")]), MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Non...", translation: "Não..."), BubbleString(text: "C'est une carte postale.", translation: "É um cartão postal.")]), MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Très bien!", translation: "Muito bem!"), BubbleString(text: "Une carte postale.", translation: "Um cartão postal.")])]]
  
  var postcardData = PostcardData(author: "Charlotte", image: "CatPicture", text: "Bonjour!\nJe m’appelle Charlotte, je suis grande:\nune fille de cinq ans!\n\nJe t’aime.\nBisous", translation: "Bom dia! Eu me chamo Charlotte, eu sou grande: uma menina de cinco anos!\n\nEu te amo.\nBeijos", stamps: [StampData(group: "verbes reguliers", number: 1, title: "Être"), StampData(group: "verbes irreguliers", number: 2, title: "Appeler"), StampData(group: "substantivos", number: 1, title: "Pessoas"), StampData(group: "números", number: 1, title: "1 a 10")])
}
