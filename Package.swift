// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DataModelKit",
  products: [
    .library(name: "DataModelKit", targets: ["DataModelKit"]),
    ],
  dependencies: [
    .package(url:"https://github.com/drmohundro/SWXMLHash.git", from: "4.2.5"),
    .package(url:"https://github.com/nvzqz/FileKit.git", from: "5.0.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(name: "DataModelKit", dependencies: ["FileKit","SWXMLHash"]),
    .testTarget(name: "DataModelKitTests", dependencies: ["DataModelKit"]),
    ]
)
