import XCTest
@testable import DataModelKit



class DataModelKitTests: XCTestCase {
  
  static let pathTest = "/Users/allanvialatte/Developer/github-poissonballon-2016/DataModelKit/Tests/RessourcesTest/Sample.xcdatamodel"
  static let sampleEntitiesCount = 6
  static let sampleArticleAttributesCount = 21
  static let sampleArticleFlagUserInfoCount = 3
  
  
  func testOpen() {
    let model = try? DataModel(with: DataModelKitTests.pathTest)
    XCTAssertNotNil(model)
  }
  
  func testCount() {
    let model = try! DataModel(with: DataModelKitTests.pathTest)
    XCTAssertEqual(model.entities.count, DataModelKitTests.sampleEntitiesCount)
    
    let article = model.entities.filter { $0.name == "Article" }.first
    XCTAssertNotNil(article)
    XCTAssertEqual(article!.attributes.count, DataModelKitTests.sampleArticleAttributesCount)

    let flag = article?.attributes.filter { $0.name == "flag" }.first
    XCTAssertNotNil(flag)
    XCTAssertEqual(flag!.userInfo.count, DataModelKitTests.sampleArticleFlagUserInfoCount)
  }
  
  
//  static var allTests = [
//    ("testExample", testExample),
//    ]
}
