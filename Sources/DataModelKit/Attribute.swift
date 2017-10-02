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
  let userInfo:[UserInfo]?
}

extension Attribute {
  
  init(with node: XMLIndexer) throws {
    self.name = try node.byKey("name").value()
    
    if let optional: String = try? node.byKey("optional").value() {
      self.optional = optional.toBool()
    } else { self.optional = false }
    
    if let indexed: String = try? node.byKey("indexed").value() {
      self.indexed = indexed.toBool()
    } else { self.indexed = false }
    
    self.defaultValue =  try? node.byKey("defaultValueString").value()
    self.type = try node.byKey("attributeType").value()
    
    self.userInfo = try? node.byKey("userInfo").children.flatMap {
      let key: String = $0.value(ofAttribute: "key")!
      let value:String = $0.value(ofAttribute: "value")!
      return (key,value)
    }
  }
  
}
