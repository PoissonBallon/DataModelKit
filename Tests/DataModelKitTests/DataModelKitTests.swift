import XCTest
@testable import DataModelKit



class DataModelKitTests: XCTestCase {
  
  static let pathTest = "/Users/allanvialatte/Developer/github-poissonballon-2016/DataModelKit/Tests/RessourcesTest/Reboot.xcdatamodel"
  
  func testOpen() {
    let model = try! DataModel(with: DataModelKitTests.pathTest)
    print(model)
  }
  
  func testExample() {
    
  }
  
  
  static var allTests = [
    ("testExample", testExample),
    ]
}
