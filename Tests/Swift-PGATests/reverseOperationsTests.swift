import XCTest

final class reverseOperationsTests: XCTestCase {
  
  func testReverseOfConstants() {
    XCTAssertEqual(|~|11, 11)
    XCTAssertEqual(|~|Float.pi, Float.pi)
  }

  func testReverseOfGrade1() {
    XCTAssertEqual((|~|e0).0, -1)
    XCTAssertEqual((|~|e0).1, e0.1)
    
    XCTAssertEqual((|~|e1).0, -1)
    XCTAssertEqual((|~|e1).1, e1.1)
    
    XCTAssertEqual((|~|e2).0, -1)
    XCTAssertEqual((|~|e2).1, e2.1)
    
    XCTAssertEqual((|~|e3).0, -1)
    XCTAssertEqual((|~|e3).1, e3.1)
    
    XCTAssertEqual(grade(e113), 1)
    XCTAssertEqual((|~|e113).0, -1)
    XCTAssertEqual((|~|e113).1, e113.1)
    
    XCTAssertEqual(grade(e131), 1)
    XCTAssertEqual((|~|e131).0, 1)
    XCTAssertEqual((|~|e131).1, e131.1)
    
  }
  
  func testReverseOfGrade2() {
    XCTAssertEqual((|~|e00).0, 0)
    XCTAssert((|~|e00).1.isEmpty)
    
    let e_00 = (1.0, [e(0),e(0)])
    XCTAssertEqual((|~|e_00).0, -1)
    XCTAssertEqual((|~|e_00).1, [e(0), e(0)])
    
    XCTAssertEqual((|~|e01).0, -1)
    XCTAssertEqual((|~|e01).1, e01.1)
    
    XCTAssertEqual((|~|e10).0, 1)
    XCTAssertEqual((|~|e10).1, e01.1)
    
    XCTAssertEqual((|~|e02).0, -1)
    XCTAssertEqual((|~|e02).1, e02.1)
    
    XCTAssertEqual((|~|e20).0, 1)
    XCTAssertEqual((|~|e20).1, e02.1)
    
    XCTAssertEqual((|~|e03).0, -1)
    XCTAssertEqual((|~|e03).1, e03.1)
    
    XCTAssertEqual((|~|e30).0, 1)
    XCTAssertEqual((|~|e30).1, e03.1)
    
    XCTAssertEqual((|~|e11).0, -1)
    XCTAssert((|~|e11).1.isEmpty)
    XCTAssertEqual((|~|e12).0, -1)
    XCTAssertEqual((|~|e12).1, e12.1)
    XCTAssertEqual((|~|e13).0, -1)
    XCTAssertEqual((|~|e13).1, e13.1)
    
    XCTAssertEqual((|~|e22).0, -1)
    XCTAssert((|~|e22).1.isEmpty)
    XCTAssertEqual((|~|e21).0, 1)
    XCTAssertEqual((|~|e21).1, e12.1)
    XCTAssertEqual((|~|e23).0, -1)
    XCTAssertEqual((|~|e23).1, e23.1)
    
    XCTAssertEqual((|~|e33).0, -1)
    XCTAssert((|~|e33).1.isEmpty)
    XCTAssertEqual((|~|e31).0, 1)
    XCTAssertEqual((|~|e31).1, e13.1)
    XCTAssertEqual((|~|e32).0, 1)
    XCTAssertEqual((|~|e32).1, e23.1)
  }
 
  func testReverseOfGrade3() {
    XCTAssertEqual((|~|e123).0, 1)
    XCTAssertEqual((|~|e123).1, e123.1)
    
    XCTAssertEqual((|~|e213).0, -1)
    XCTAssertEqual((|~|e213).1, e123.1)
    
    XCTAssertEqual((|~|e231).0, 1)
    XCTAssertEqual((|~|e231).1, e123.1)
    
    XCTAssertEqual((|~|e312).0, 1)
    XCTAssertEqual((|~|e312).1, e123.1)
    
    XCTAssertEqual((|~|e321).0, -1)
    XCTAssertEqual((|~|e321).1, e123.1)
  }
}

