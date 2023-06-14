//
//  Line.swift
//  Jarrive
//
//  Created by Felipe Girardi on 14/06/23.
//

import SwiftUI

struct HDashedLine: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width * 0.9, y: 0))
    return path.offsetBy(dx: rect.width * 0.05, dy: 0)
  }
}

struct VDashedLine: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width, y: rect.height))
    return path
  }
}
