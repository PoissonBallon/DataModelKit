//
//  DataModelError.swift
//  DataModelKit
//
//  Created by Allan Vialatte on 02/10/2017.
//

import Foundation

public enum DataModelError: Error {
  
  // MARK: Target Reader Error
  case targetIsNotAnXcdataModel
  case targetHaveNotContent
  case targetIsNotReadable
  
  // MARK: Parser Entity Error
  case parserEntityNameError
  
  // MARK: Parser Attribute Error
  case parserAttributeNameError
  case parserAttributeTypeError
  
  // MARK: Parser UserInfo Error
  case parserUserInfoKeyError
  case parserUserInfoValueError
}
