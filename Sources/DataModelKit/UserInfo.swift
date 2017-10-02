//
//  UserInfo.swift
//  DataModelKitPackageDescription
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import SWXMLHash

struct UserInfo {
  let key: String
  let value: String
}

extension UserInfo {

  init(with node: XMLIndexer) throws {
    guard let key = node.element?.attribute(by: "key")?.text else {
      throw DataModelError.parserUserInfoKeyError
    }
    guard let value = node.element?.attribute(by: "value")?.text else {
      throw DataModelError.parserUserInfoValueError
    }

    self.key = key
    self.value = value
  }
}
