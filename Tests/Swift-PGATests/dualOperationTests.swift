
import XCTest

final class dualOperationTests: XCTestCase {
  
  func testDualOfGrade0() {
    XCTAssertEqual(dual(e0).0, 1)
    XCTAssertEqual(dual(e0).1, e123.1)
    XCTAssertEqual(dual(e11).0, 1)
    XCTAssertEqual(dual(e11).1, e0123.1)
    XCTAssertEqual(dual(e22).0, 1)
    XCTAssertEqual(dual(e22).1, e0123.1)
    XCTAssertEqual(dual(e33).0, 1)
    XCTAssertEqual(dual(e33).1, e0123.1)
    
    XCTAssertEqual(dual(10).0, 10)
    XCTAssertEqual(dual(10).1, e123.1)
  }
    
  func testDualOfGrade1() {
    XCTAssertEqual((|!|e1).0, -1)
    XCTAssertEqual((|!|e1).1, e023.1)
    XCTAssertEqual((|!|e2).0, 1)
    XCTAssertEqual((|!|e2).1, e013.1)
    XCTAssertEqual((|!|e3).0, -1)
    XCTAssertEqual((|!|e3).1, e012.1)
  }
  
  func testDualOfGrade2() {
    XCTAssertEqual(dual(e12).0, 1)
    XCTAssertEqual(dual(e12).1, e03.1)
    XCTAssertEqual(dual(e21).0, -1)
    XCTAssertEqual(dual(e21).1, e03.1)
    XCTAssertEqual(dual(e13).0, -1)
    XCTAssertEqual(dual(e13).1, e02.1)
    XCTAssertEqual(dual(e31).0, 1)
    XCTAssertEqual(dual(e31).1, e02.1)
    XCTAssertEqual(dual(e23).0, 1)
    XCTAssertEqual(dual(e23).1, e01.1)
    XCTAssertEqual(dual(e32).0, -1)
    XCTAssertEqual(dual(e32).1, e01.1)
  }
  
  func testDualOfGrade3() {
    XCTAssertEqual(dual(e123).0, -1)
    XCTAssertEqual(dual(e123).1, [e(0)])
    XCTAssertEqual(dual(e213).0, 1)
    XCTAssertEqual(dual(e213).1, [e(0)])
    XCTAssertEqual(dual(e132).0, 1)
    XCTAssertEqual(dual(e132).1, [e(0)])
    XCTAssertEqual(dual(e312).0, -1)
    XCTAssertEqual(dual(e312).1, [e(0)])
    XCTAssertEqual(dual(e231).0, -1)
    XCTAssertEqual(dual(e231).1, [e(0)])
    XCTAssertEqual(dual(e321).0, 1)
    XCTAssertEqual(dual(e321).1, [e(0)])
  }
}

