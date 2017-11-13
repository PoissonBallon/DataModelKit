import XCTest
@testable import DataModelKit

class DataModelKitTests: XCTestCase {
  
  static let pathTest = "./Tests/RessourcesTest/Sample.xcdatamodel"
  static let sampleEntitiesCount = 6
  static let sampleArticleAttributesCount = 21
  static let sampleArticleFlagUserInfoCount = 3
  static let sampleArticleRelationhipCount = 2
  static let sampleArticleParagraphRelationhipCount = 1
  
  
  func testOpen() {
    let model = try? DataModel(with: DataModelKitTests.pathTest)
    XCTAssertNotNil(model)
    XCTAssertEqual(model!.documentVersion, "1.0")
    XCTAssertEqual(model!.systemVersion, "16G29")
  }
  
  func testCount() {
    let model = try! DataModel(with: DataModelKitTests.pathTest)
    XCTAssertEqual(model.entities.count, DataModelKitTests.sampleEntitiesCount)
    
    let article = model.entities.first { $0.name == "Article" }
    XCTAssertNotNil(article)
    XCTAssertEqual(article!.attributes.count, DataModelKitTests.sampleArticleAttributesCount)
    
    let flag = article?.attributes.first { $0.name == "flag" }
    XCTAssertNotNil(flag)
    XCTAssertEqual(flag!.userInfos.count, DataModelKitTests.sampleArticleFlagUserInfoCount)
  }
  
  func testRelationship() {
    let model = try! DataModel(with: DataModelKitTests.pathTest)
    
    let entitie = model.entities.first { $0.name == "ArticleParagraph" }
    guard let paragraph = entitie else { XCTFail();return }
    XCTAssertEqual(paragraph.relationships.count, DataModelKitTests.sampleArticleParagraphRelationhipCount)
    guard let relationship = paragraph.relationships.first else { XCTFail();return }
    XCTAssertEqual(relationship.name, "article")
    XCTAssertEqual(relationship.destination, "Article")
    XCTAssertEqual(relationship.inverse!, "paragraphs")
    XCTAssertEqual(relationship.optional, true)
    XCTAssertEqual(relationship.toOne, true)
    
    let entitieTwo = model.entities.first { $0.name == "Article" }
    guard let article = entitieTwo else { XCTFail();return }
    XCTAssertEqual(article.relationships.count, DataModelKitTests.sampleArticleRelationhipCount)
    let relaOne = article.relationships.first { $0.name  == "images" }
    guard let images = relaOne else { XCTFail();return }
    XCTAssertEqual(images.destination, "ArticleImage")
    XCTAssertEqual(images.inverse, nil)
    XCTAssertEqual(images.toMany, true)
    
  }
}
