//
//  Relationship.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import SWXMLHash

public struct Relationship {
  public let name: String
  public let destination: String
  public let inverse: String?
  public let userInfo: [UserInfo]
  public let toMany: Bool
  public let toOne: Bool
  public let optional: Bool
  public let syncable: Bool
  public let ordered: Bool
}

extension Relationship {
  public init(with node: XMLIndexer) throws {
    guard let name = node.element?.attribute(by: "name")?.text else {
      throw DataModelError.parserRelationshipNameError
    }
    guard let destination = node.element?.attribute(by: "destinationEntity")?.text else {
      throw DataModelError.parserRelationshipInverseError
    }
    self.name = name
    self.destination = destination
    self.inverse = node.element?.attribute(by: "inverseName")?.text
    self.userInfo = node["userInfo"].children.flatMap { try? UserInfo.init(with: $0) }
    self.toMany = (node.element?.attribute(by: "toMany")?.text == "YES") ? true : false
    self.toOne = !self.toMany
    self.optional = (node.element?.attribute(by: "optional")?.text == "YES") ? true : false
    self.syncable = (node.element?.attribute(by: "syncable")?.text == "YES") ? true : false
    self.ordered = (node.element?.attribute(by: "ordered")?.text == "YES") ? true : false
  }
}
