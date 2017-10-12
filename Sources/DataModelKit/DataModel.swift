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
  private let root: XMLIndexer
  
  public let path: Path
  public let entities: [Entity]
  public let documentVersion: String
  public let systemVersion: String
  public let minimumToolsVersion: String
  public let lastSavedToolsVersion: String
}

extension DataModel {
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
    self.documentVersion = self.root["model"].element?.attribute(by: "documentVersion")?.text ?? ""
    self.systemVersion = self.root["model"].element?.attribute(by: "systemVersion")?.text ?? ""
    self.minimumToolsVersion = self.root["model"].element?.attribute(by: "minimumToolsVersion")?.text ?? ""
    self.lastSavedToolsVersion = self.root["model"].element?.attribute(by: "lastSavedToolsVersion")?.text ?? ""
    self.entities = self.root["model"]["entity"].all.flatMap { try? Entity(with: $0) }
  }
}
