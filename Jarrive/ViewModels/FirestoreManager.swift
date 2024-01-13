//
//  FirestoreManager.swift
//  Jarrive
//
//  Created by Felipe Girardi on 03/01/24.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class FirestoreManager: ObservableObject {
  @Published var onboardingChatMessages = [MessageData]()
  @Published var onboardingOptionPauseIndexes = [Int]()
  @Published var onboardingPauseMessageFluxIndexes = [Int]()
  @Published var onboardingUserTextFieldPauseIndexes = [Int]()
  @Published var onboardingVariableOptionMessageIndexes = [Int]()
  @Published var firstPostcard = PostcardData()
  @Published var postLoginOptionPauseIndexes = [Int]()
  @Published var postLoginOptionExtraMessagesIndexes = [Int]()
  @Published var postLoginOptionTryAgainIndexes = [Int]()
  private var isOnboardingDone = UserDefaults.standard.bool(forKey: "isOnboardingDone")
  let onboardingMessagesRoute = "chats/onboardingChat/messages"
  let onboardingVariableMessagesRoute = "chats/onboardingChat/variableMessages"
  let firstPostcardsRoute = "postcards/charlottePostcard"
  let postLoginMessagesRoute = "chats/postLoginChat/messages"
  let db = Firestore.firestore()
  
  init() {
    if !isOnboardingDone {
      fetchOnboardingChat()
      fetchFirstPostcard(route: firstPostcardsRoute)
    }
  }
  
  func fetchChatMessages(route: String) {
    db.collection(route).order(by: "id").addSnapshotListener { (querySnapshot, error) in
      if let error = error as NSError? {
        print("Error getting collection: \(error.localizedDescription)")
      }
      
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }
      
      self.onboardingChatMessages.append(contentsOf: documents.compactMap { document -> MessageData? in
        return try? document.data(as: MessageData.self)
      })
    }
  }
  
  func fetchOnboardingSpecialIndexes() {
    db.collection("chats").document("onboardingChat").getDocument { (document, error) in
      if let error = error as NSError? {
        print("Error getting document: \(error.localizedDescription)")
      }
      if let document = document {
        self.onboardingOptionPauseIndexes = document.get("optionPauseIndexes") as? [Int] ?? []
        self.onboardingPauseMessageFluxIndexes = document.get("pauseMessageFluxIndexes") as? [Int] ?? []
        self.onboardingUserTextFieldPauseIndexes = document.get("userTextFieldPauseIndexes") as? [Int] ?? []
        self.onboardingVariableOptionMessageIndexes = document.get("variableOptionMessageIndexes") as? [Int] ?? []
      } else {
        print("Document does not exist in cache")
      }
    }
  }
  
  func fetchOnboardingChat() {
    fetchChatMessages(route: onboardingMessagesRoute)
    fetchOnboardingSpecialIndexes()
  }
  
  func fetchFirstPostcard(route: String) {
    db.collection("postcards").document("charlottePostcard").getDocument { (document, error) in
      if let error = error as NSError? {
        print("Error getting document: \(error.localizedDescription)")
      }
      if let document = document {
        do {
          self.firstPostcard = try document.data(as: PostcardData.self)
        } catch {
          print(error)
        }
      } else {
        print("Document does not exist in cache")
      }
    }
  }
  
  func fetchPostLoginSpecialIndexes() {
    db.collection("chats").document("postLoginChat").getDocument { (document, error) in
      if let error = error as NSError? {
        print("Error getting document: \(error.localizedDescription)")
      }
      if let document = document {
        self.postLoginOptionPauseIndexes = document.get("optionPauseIndexes") as? [Int] ?? []
        self.postLoginOptionExtraMessagesIndexes = document.get("optionExtraMessagesIndexes") as? [Int] ?? []
        self.postLoginOptionTryAgainIndexes = document.get("optionTryAgainIndexes") as? [Int] ?? []
      } else {
        print("Document does not exist in cache")
      }
    }
  }
  
  func fetchPostLoginChat() {
    fetchChatMessages(route: postLoginMessagesRoute)
    fetchPostLoginSpecialIndexes()
  }
}
