//
//  DataModelEntity.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import SWXMLHash

struct Entity {
  let name: String
  let attributes: [Attribute]
}

extension Entity {
  init(with node: XMLIndexer) throws {
    guard let name = node.element?.attribute(by: "name")?.text else {
      throw DataModelError.parserEntityError
    }
    self.name = name
    
    self.attributes = try node.byKey("attribute").all.flatMap { try Attribute(with: $0) }
  }
}
