//
//  DataModelEntity.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import SWXMLHash

public struct Entity {
  public let name: String
  public let userInfos: [UserInfo]
  public let attributes: [Attribute]
  public let relationships: [Relationship]
}

extension Entity {
  
  public init(with node: XMLIndexer) throws {
    guard let name = node.element?.attribute(by: "name")?.text else {
      throw DataModelError.parserEntityNameError
    }
    self.name = name
    self.attributes = node["attribute"].all.flatMap { try? Attribute.init(with: $0) }
    self.userInfos = node["userInfo"].children.flatMap { try? UserInfo.init(with: $0) }
    self.relationships = node["relationship"].all.flatMap { try? Relationship.init(with: $0) }
  }
}
