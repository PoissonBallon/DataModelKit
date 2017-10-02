//
//  DataModelError.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation

enum DataModelError: Error {
  case targetIsNotAnXcdataModel
  case targetHaveNotContent
  case targetIsNotReadable

  case parserEntityError
}
