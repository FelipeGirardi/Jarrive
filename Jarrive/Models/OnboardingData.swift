//
//  OnboardingData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 12/10/23.
//

import Foundation

struct OnboardingData: Equatable {
  let pauseMessageFluxIndexes = [1, 5, 8, 10, 15, 18]
  let userTextFieldPauseIndexes = [5, 10]
  let optionPauseIndexes = [1, 8, 15, 18]
  let variableOptionMessageIndexes = [1, 15]
  let variableOptionFollowingMessages = [
    [MessageData(id: 3, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]), MessageData(id: 3, type: "text", user: "cat", textArray: [BubbleString(text: "Bonsoir, alors!", translation: "Boa noite, então!")])],
    [MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Non...", translation: "Não..."), BubbleString(text: "C'est une carte postale.", translation: "É um cartão postal.")]), MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Non...", translation: "Não..."), BubbleString(text: "C'est une carte postale.", translation: "É um cartão postal.")]), MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Très bien!", translation: "Muito bem!"), BubbleString(text: "Une carte postale.", translation: "Um cartão postal.")])]
  ]
  
  let tryAgainIndexesCorrectAnswers = [0, 1, 1]
  let tryAgainFollowingMessages = [
    [MessageData(id: 35, type: "text", user: "cat", textArray: [BubbleString(text: "Correct!", translation: "Correto!"), BubbleString(text: " 🤩 "), BubbleString(text: "Je suis un chat!", translation: "Eu sou um gato!")]), MessageData(id: 35, type: "text", user: "cat", textArray: [BubbleString(text: "Essaie a nouveau!", translation: "Tente de novo!"), BubbleString(text: " 😥")])],
    [MessageData(id: 38, type: "text", user: "cat", textArray: [BubbleString(text: "Essaie a nouveau!", translation: "Tente de novo!"), BubbleString(text: " 😥")]), MessageData(id: 35, type: "text", user: "cat", textArray: [BubbleString(text: "Correct!", translation: "Correto!"), BubbleString(text: " 🤩 "), BubbleString(text: "C’est une carte postale.", translation: "É um cartão postal.")])],
    [MessageData(id: 41, type: "text", user: "cat", textArray: [BubbleString(text: "Essaie a nouveau!", translation: "Tente de novo!"), BubbleString(text: " 😥")]), MessageData(id: 35, type: "text", user: "cat", textArray: [BubbleString(text: "Correct!", translation: "Correto!"), BubbleString(text: " 🤩 "), BubbleString(text: "Issa est facteur.", translation: "Issa é carteiro.")])]
  ]
  
  var postcardData = PostcardData(author: "Charlotte", image: "CatPicture", text: "Bonjour!\nJe m’appelle Charlotte, je suis grande:\nune fille de cinq ans!\n\nJe t’aime.\nBisous", translation: "Bom dia! Eu me chamo Charlotte, eu sou grande: uma menina de cinco anos!\n\nEu te amo.\nBeijos", stamps: [StampData(group: "verbes reguliers", number: 1, title: "Être"), StampData(group: "verbes irreguliers", number: 2, title: "Appeler"), StampData(group: "substantivos", number: 1, title: "Pessoas"), StampData(group: "números", number: 1, title: "1 a 10")])
  
  let dummyChatMessages = [
    MessageData(id: 0, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 1, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 2, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 3, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 4, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 5, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 6, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 7, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 8, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 9, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 10, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 11, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 12, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 13, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 14, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 15, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 16, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 17, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 18, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 19, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
    MessageData(id: 20, type: "text", user: "cat", textArray: [BubbleString(text: "Bonjour, alors!", translation: "Bom dia, então!")]),
  ]
}
