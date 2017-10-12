//
//  DataModel.swift
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
import FileKit
import SWXMLHash

/// DataModel
public struct DataModel {
  private let root: XMLIndexer
  
  public let path: Path   /// Path of the original file.xcdatamodel
  public let entities: [Entity] /// Parsed model's entities
  public let documentVersion: String /// Version of file.xcdatamodel
  public let systemVersion: String /// System version of file.xcdatamodel
  public let minimumToolsVersion: String /// Minimum tools version of file.xcdatamodel
  public let lastSavedToolsVersion: String /// Last saved tools version of file.xcdatamodel
}

extension DataModel {

  /// Parse and init DataModel
  ///
  /// - Parameter path: Take the path of an file.xcdatamodel
  /// - Throws: throw different error if needed
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
