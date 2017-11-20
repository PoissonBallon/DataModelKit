//
//  File.swift
//  DataModelKitPackageDescription
//
//  Created by Allan Vialatte on 18/11/2017.
//

import Foundation

public enum AttributeType: String {
  case undefined      = "Undefined"
  case integer16      = "Integer 16"
  case integer32      = "Integer 32"
  case integer64      = "Integer 64"
  case decimal        = "Decimal"
  case double         = "Double"
  case float          = "Float"
  case string         = "String"
  case boolean        = "Boolean"
  case date           = "Date"
  case binaryData     = "BinaryData"
  case uuid           = "UUID"
  case uri            = "URI"
  case transformable  = "Transformable"
}
