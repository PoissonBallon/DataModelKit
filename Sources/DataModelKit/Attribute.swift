//
//  Attribute.swift
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

public struct Attribute {
  public let name: String
  public let optional: Bool
  public let indexed: Bool
  public let defaultValue: String?
  public let type: AttributeType
  public let userInfos: [UserInfo]
}

extension Attribute {

  public init(with node: XMLIndexer) throws {
    guard let name = node.element?.attribute(by: "name")?.text else {
      throw DataModelError.parserAttributeNameError
    }
    guard let type = node.element?.attribute(by: "attributeType")?.text else {
      throw DataModelError.parserAttributeTypeError
    }

    self.name = name
    self.type = type
    self.optional = (node.element?.attribute(by: "optional")?.text == "YES") ? true : false
    self.indexed = (node.element?.attribute(by: "indexed")?.text == "YES") ? true : false
    self.defaultValue = node.element?.attribute(by: "defaultValueString")?.text
    self.userInfos = node["userInfo"].children.flatMap { try? UserInfo.init(with: $0) }
  }
}
