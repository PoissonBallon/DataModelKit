//
//  File.swift
//  DataModelKitPackageDescription
//
//  Created by Allan Vialatte on 18/11/2017.
//

import Foundation

enum AttributeType: String {
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

extension AttributeType {
  var swiftType: Type {
    switch self {
    case .undefined, .transformable:
      return "Any"
    case .integer16, .integer32, .integer64:
      return "Int"
    case .decimal, .double:
      return "Double"
    case .float:
      return "Float"
    case .string, .uuid:
      return "String"
    case .boolean:
      return "Bool"
    case .date:
      return "Date"
    case .binaryData:
      return "Data"
    case .uri:
      return "URL"
    }
  }
}
