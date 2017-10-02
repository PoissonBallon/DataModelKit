//
//  Tools.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation

extension String {
  func toBool() -> Bool {
    switch self {
    case "True", "true", "yes", "1", "y", "YES", "TRUE":
      return true
    case "False", "false", "no", "0", "n", "FALSE","NO":
      return false
    default:
      return false
    }
  }
}
