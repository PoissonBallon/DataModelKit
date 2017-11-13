<h3 align="center">
    <img src="Assets/data_model_kit_200.png" width="200" />
</h3>
<h1 align="center">
  DataModelKit
</h1>



<!-- [![Version](https://img.shields.io/cocoapods/v/EasyRealm.svg?style=flat)](http://cocoapods.org/pods/EasyRealm)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/EasyRealm.svg?style=flat)](http://cocoapods.org/pods/EasyRealm)
[![Build Status](https://travis-ci.org/PoissonBallon/EasyRealm.svg?branch=master)](https://travis-ci.org/PoissonBallon/EasyRealm)
[![Swift 4](https://img.shields.io/badge/Language-Swift%203-orange.svg)](https://developer.apple.com/swift/)
[![Coverage Status](https://coveralls.io/repos/github/PoissonBallon/EasyRealm/badge.svg?branch=master)](https://coveralls.io/github/PoissonBallon/EasyRealm?branch=master)
[![License](https://img.shields.io/cocoapods/l/EasyRealm.svg?style=flat)](http://cocoapods.org/pods/EasyRealm)
 -->

DataModelKit is a simple and light framework to parse and read __*.xcdatamodel__ files. It provides an API to navigate and explore __DataModel__

It's used in DataModelGen tools. _(available soon)_

## Usage

### Init a DataModel Object

```swift
import DataModelKit

static let path = "Project/Ressources/Sample.xcdatamodel"
let model = try? DataModel(with: DataModelKitTests.pathTest)

print(model.entities)
```

## Installation

EasyRealm is available through [CocoaPods](http://cocoapods.org), [Carthage](https://github.com/Carthage/Carthage) and [SPM](https://github.com/apple/swift-package-manager).

#### CocoaPods
```ruby
use_frameworks!

pod "DataModelKit"
```

#### Carthage
```ruby

github 'PoissonBallon/DataModelKit'
```

#### SPM
```swift
 dependencies: [
    .package(url: "https://github.com/PoissonBallon/DataModelKit.git", .upToNextMinor(from:"1.0.0"))
  ],
```


## API

DataModelKit provide somes structs with attribute to exploite your DataModel

#### DataModel
It is the root object of your DataModel

```swift

public struct DataModel {  
  public let path: Struct   /// Path of the original file.xcdatamodel
  public let entities: [Entity] /// Parsed model's entities
  public let documentVersion: String /// Version of file.xcdatamodel
  public let systemVersion: String /// System version of file.xcdatamodel
  public let minimumToolsVersion: String /// Minimum tools version of file.xcdatamodel
  public let lastSavedToolsVersion: String /// Last saved tools version of file.xcdatamodel
}
```

#### Entity

```swift
public struct Entity {
  public let name: String ///
  public let userInfos: [UserInfo]
  public let attributes: [Attribute]
  public let relationships: [Relationship]
}
```

#### Relationship

```swift
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

```

#### Attribute
```swift
public struct Attribute {
  public let name: String
  public let optional: Bool
  public let indexed: Bool
  public let defaultValue: String?
  public let type: String
  public let userInfos: [UserInfo]
}
```

## Author

* PoissonBallon [@poissonballon](https://twitter.com/poissonballon)

## License

DataModelKit is available under the MIT license. See the LICENSE file for more info.

## Other

* Thanks to [Adrien Groleas](https://adriengroleas.fr) for logo
* Thanks to [@trpl](https://github.com/trpl) for text review
