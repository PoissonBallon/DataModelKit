//
//  DataModel.swift
//  DataModelKitPackageDescription
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation
import FileKit
import SWXMLHash

public struct DataModel {
  public let entities: [Entity]
  public let path: Path
  private let root: XMLIndexer
  
  public init(with path: String) throws {
    let resolvedPath = Path(path).resolved
    let file = File<Data>.init(path: resolvedPath + "contents")
    
    guard resolvedPath.pathExtension == DataModelKit.dataModelExtension else {
      throw DataModelError.targetIsNotAnXcdataModel
    }
    guard file.exists else {
      throw DataModelError.targetHaveNotContent
    }
    guard let data = try? file.read() else {
      throw DataModelError.targetIsNotReadable
    }
    
    self.path = resolvedPath
    self.root = SWXMLHash.parse(data)
    self.entities = self.root["model"]["entity"].all.flatMap { try? Entity(with: $0) }
  }
}
