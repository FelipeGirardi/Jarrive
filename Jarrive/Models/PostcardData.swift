//
//  PostcardData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 18/11/23.
//

import Foundation

struct PostcardData: Hashable {
  var author: String
  var image: String
  var text: String
  var translation: String
  var stamps: [StampData]
}
