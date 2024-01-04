//
//  FirestoreManager.swift
//  Jarrive
//
//  Created by Felipe Girardi on 03/01/24.
//

import Foundation
import FirebaseFirestore

class FirestoreManager: ObservableObject {
  @Published var onboardingChatMessages = [MessageData]()
  @Published var onboardingOptionPauseIndexes = [Int]()
  @Published var onboardingPauseMessageFluxIndexes = [Int]()
  @Published var onboardingUserTextFieldPauseIndexes = [Int]()
  @Published var onboardingVariableOptionMessageIndexes = [Int]()
//  @Published var onboardingVariableMessages = [String: [String: [String: Any]]]()
  @Published var firstPostcard = PostcardData()
  let onboardingMessagesRoute = "chats/onboardingChat/messages"
  let onboardingVariableMessagesRoute = "chats/onboardingChat/variableMessages"
  let firstPostcardsRoute = "postcards/charlottePostcard"
  let postLoginMessagesRoute = "chats/postLoginChat/messages"
  let db = Firestore.firestore()
  
  init() {
    fetchChatMessages(route: onboardingMessagesRoute)
    fetchSpecialIndexes()
    fetchFirstPostcard(route: firstPostcardsRoute)
//    fetchChatMessages(route: postLoginMessagesRoute)
    
//    fetchChatVariableMessages(route: onboardingVariableMessagesRoute)
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
      
      print("*****")
      print(self.onboardingChatMessages)
    }
  }
  
  func fetchSpecialIndexes() {
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
  
  //  func fetchChatVariableMessages(route: String) {
  //    db.collection(route).addSnapshotListener { (querySnapshot, error) in
  //      guard var documents = querySnapshot?.documents else {
  //        print("No documents")
  //        return
  //      }
  //
  //      self.onboardingChatMessages = documents.compactMap { document -> MessageData? in
  //        return try? document.data(as: MessageData.self)
  //      }
  //    }
  //  }
}
