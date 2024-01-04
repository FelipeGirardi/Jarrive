//
//  StampData.swift
//  Jarrive
//
//  Created by Felipe Girardi on 18/11/23.
//

import Foundation

struct StampData: Hashable, Codable {
  var group: String
  var number: Int
  var title: String
}

enum StampType {
  case small
  case large
}
