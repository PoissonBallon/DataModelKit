//
//  Relationship.swift
//  DataModelKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2017 Vialatte Allan
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
