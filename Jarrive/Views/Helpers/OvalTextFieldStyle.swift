//
//  OvalTextFieldStyle.swift
//  Jarrive
//
//  Created by Felipe Girardi on 06/11/23.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(10)
      .background(.white)
      .cornerRadius(20)
  }
}
