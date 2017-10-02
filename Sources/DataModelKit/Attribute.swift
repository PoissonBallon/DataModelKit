//
//  Attribute.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import SWXMLHash

struct Attribute {
  let name: String
  let optional: Bool
  let indexed: Bool
  let defaultValue: String?
  let type: String
  let userInfo: [UserInfo]
}

extension Attribute {
  
  init(with node: XMLIndexer) throws {
    guard let name = node.element?.attribute(by: "name")?.text else {
      throw DataModelError.parserAttributeNameError
    }
    guard let type = node.element?.attribute(by: "attributeType")?.text else {
      throw DataModelError.parserAttributeTypeError
    }
    
    self.name = name
    self.type = type
    self.optional = node.element?.attribute(by: "optional")?.text.toBool() ?? false
    self.indexed = node.element?.attribute(by: "indexed")?.text.toBool() ?? false
    self.defaultValue = node.element?.attribute(by: "defaultValueString")?.text
    self.userInfo = node["userInfo"].children.flatMap { try? UserInfo.init(with: $0) }
  }
}
