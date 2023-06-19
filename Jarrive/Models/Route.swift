//
//  Route.swift
//  Jarrive
//
//  Created by Felipe Girardi on 07/06/23.
//

import Foundation

struct Route: Hashable {
  var number: Int
  var origin: String
  var destination: String
  var isExpanded: Bool
}
