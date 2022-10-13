import XCTest

final class innerProductTests: XCTestCase {
  
  func testScalarInnerProdGrade1() {
    let e0 = 10 ||| e(0)
    XCTAssertEqual(e0.0, 10)
    XCTAssertEqual(e0.1, [e(0)])
    
    let e1 = e(1) ||| 22
    XCTAssertEqual(e1.0, 22)
    XCTAssertEqual(e1.1, [e(1)])
  }
  
  func testGrade1InnerProdGrade1WithCoefficents() {
    let inner_e0:(Double,[e]) = (1, e(0)) ||| (1, e(0))
    XCTAssertEqual(inner_e0.0, 0)
    XCTAssertEqual(inner_e0.1, [])

    
    let inner_e1:(Double,[e]) = (3, e(1)) ||| (4, e(1))
    XCTAssertEqual(inner_e1.0, 12)
    
    let inner_e2:(Double,[e]) = (2, e(2)) ||| (2, e(2))
    XCTAssertEqual(inner_e2.0, 4)
    
    let inner_e12:(Double,[e]) = (1, e(1)) ||| (2, e(2))
    XCTAssertEqual(inner_e12.0, 0)
  }
  
  func testGrade2InnerProdGrade1() {
    let inner_1e0_1e0:(Double, [e]) = (1, [e(0)]) ||| (1, e(0))
    XCTAssertEqual(inner_1e0_1e0.0, 0)
    XCTAssert(inner_1e0_1e0.1.isEmpty)
    
    let inner_1e0_1e0_rev:(Double, [e]) = (1, e(0)) ||| (1, [e(0)])
    XCTAssertEqual(inner_1e0_1e0_rev.0, 0)
    XCTAssert(inner_1e0_1e0_rev.1.isEmpty)
    
    let inner_1e1_1e1:(Double, [e]) = (1, [e(1)]) ||| (1, e(1))
    XCTAssertEqual(inner_1e1_1e1.0, 1)
    XCTAssert(inner_1e1_1e1.1.isEmpty)
    
    let inner_1e1_1e1_rev:(Double, [e]) = (1, e(1)) ||| (1, [e(1)])
    XCTAssertEqual(inner_1e1_1e1_rev.0, 1)
    XCTAssert(inner_1e1_1e1_rev.1.isEmpty)
    
    let inner_1e01_1e1:(Double, [e]) = (1, [e(0),e(1)]) ||| (1, e(1))
    XCTAssertEqual(inner_1e01_1e1.0, 1)
    XCTAssertEqual(inner_1e01_1e1.1.first!, e(0))
    
    
    let inner_1e01_1e1_rev:(Double, [e]) = (1, e(1)) ||| (1, [e(0),e(1)])
    XCTAssertEqual(inner_1e01_1e1_rev.0, -1)
    XCTAssertEqual(inner_1e01_1e1.1.first!, e(0))
    
    
    let inner_1e12_1e1:(Double, [e]) = (1, [e(1),e(2)]) ||| (1, e(1))
    XCTAssertEqual(inner_1e12_1e1.0, -1)
    XCTAssert(!inner_1e12_1e1.1.isEmpty)
    XCTAssertEqual(inner_1e12_1e1.1, [e(2)])
    
    let inner_1e12_1e1_rev:(Double, [e]) = (1, e(1)) ||| (1, [e(1),e(2)])
    XCTAssertEqual(inner_1e12_1e1_rev.0, 1)
    XCTAssert(!inner_1e12_1e1_rev.1.isEmpty)
    XCTAssertEqual(inner_1e12_1e1_rev.1, [e(2)])
    
    let inner_1e1_1e12:(Double, [e]) = (1, e(1)) ||| (1,[e(1),e(2)])
    XCTAssertEqual(inner_1e1_1e12.0, 1)
    XCTAssert(!inner_1e1_1e12.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e12.1, [e(2)])
    
    let inner_1e1_1e12_rev:(Double, [e]) = (1,[e(1),e(2)]) ||| (1, e(1))
    XCTAssertEqual(inner_1e1_1e12_rev.0, -1)
    XCTAssert(!inner_1e1_1e12_rev.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e12_rev.1, [e(2)])
    
    let inner_1e1_1e21:(Double, [e]) = (1, e(1)) ||| (1,[e(2),e(1)])
    XCTAssertEqual(inner_1e1_1e21.0, -1)
    XCTAssert(!inner_1e1_1e21.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e21.1, [e(2)])
    
    let inner_1e1_1e21_rev:(Double, [e]) = (1,[e(2),e(1)]) ||| (1, e(1))
    XCTAssertEqual(inner_1e1_1e21_rev.0, 1)
    XCTAssert(!inner_1e1_1e21_rev.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e21_rev.1, [e(2)])
    
    let inner_1e0_1e12:(Double, [e]) = (1, e(0)) ||| (1,[e(1),e(2)])
    XCTAssert(inner_1e0_1e12.1.isEmpty)
    XCTAssertEqual(inner_1e0_1e12.0, 0)
    
    let inner_1e0_1e12_rev:(Double, [e]) = (1,[e(1),e(2)]) ||| (1, e(0))
    XCTAssert(inner_1e0_1e12_rev.1.isEmpty)
    XCTAssertEqual(inner_1e0_1e12_rev.0, 0)
    
    let inner_2e0_5e12:(Double, [e]) = (2, e(0)) ||| (5,[e(1),e(2)])
    XCTAssert(inner_1e0_1e12.1.isEmpty)
    XCTAssertEqual(inner_2e0_5e12.0, 0)
    
    let inner_2e0_5e12_rev:(Double, [e]) = (5,[e(1),e(2)]) ||| (2, e(0))
    XCTAssert(inner_2e0_5e12_rev.1.isEmpty)
    XCTAssertEqual(inner_2e0_5e12_rev.0, 0)
    
    let inner_2e10_5e2:(Double, [e]) = (2, [e(1),e(0)]) ||| (5, e(2))
    XCTAssert(inner_2e10_5e2.1.isEmpty)
    XCTAssertEqual(inner_2e10_5e2.0, 0)
    
    let inner_2e10_5e2_rev:(Double, [e]) = (5, e(2)) ||| (2, [e(1),e(0)])
    XCTAssert(inner_2e10_5e2_rev.1.isEmpty)
    XCTAssertEqual(inner_2e10_5e2_rev.0, 0)
    
    
    let inner_2e320_5e1:(Double, [e]) = (2, [e(3),e(2),e(0)]) ||| (5, e(1))
    XCTAssert(inner_2e320_5e1.1.isEmpty)
    XCTAssertEqual(inner_2e320_5e1.0, 0)
    
    let inner_2e320_5e1_rev:(Double, [e]) = (5, e(1)) ||| (2, [e(3),e(2),e(0)])
    XCTAssert(inner_2e320_5e1_rev.1.isEmpty)
    XCTAssertEqual(inner_2e320_5e1_rev.0, 0)
  }
  
  func testGrade2InnerProdGrade2() {
    let inner_1e0_1e0:(Double, [e]) = (1, [e(0)]) ||| (1, [e(0)])
    XCTAssertEqual(inner_1e0_1e0.0, 0)
    XCTAssert(inner_1e0_1e0.1.isEmpty)
    
    let inner_1e1_1e1:(Double, [e]) = (1, [e(1)]) ||| (1, [e(1)])
    XCTAssertEqual(inner_1e1_1e1.0, 1)
    XCTAssert(inner_1e1_1e1.1.isEmpty)
    
    let inner_1e01_1e1:(Double, [e]) = (1, [e(0),e(1)]) ||| (1, [e(1)])
    XCTAssertEqual(inner_1e01_1e1.0, 1)
    XCTAssertEqual(inner_1e01_1e1.1.first!, e(0))
    
    
    let inner_1e12_1e1:(Double, [e]) = (1, [e(1),e(2)]) ||| (1, [e(1)])
    XCTAssertEqual(inner_1e12_1e1.0, -1)
    XCTAssert(!inner_1e12_1e1.1.isEmpty)
    XCTAssertEqual(inner_1e12_1e1.1, [e(2)])
    
    let inner_1e1_1e12:(Double, [e]) = (1, [e(1)]) ||| (1,[e(1),e(2)])
    XCTAssertEqual(inner_1e1_1e12.0, 1)
    XCTAssert(!inner_1e1_1e12.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e12.1, [e(2)])
    
    let inner_1e1_1e21:(Double, [e]) = (1, [e(1)]) ||| (1,[e(2),e(1)])
    XCTAssertEqual(inner_1e1_1e21.0, -1)
    XCTAssert(!inner_1e1_1e21.1.isEmpty)
    XCTAssertEqual(inner_1e1_1e21.1, [e(2)])
    
    let inner_1e0_1e12:(Double, [e]) = (1, [e(0)]) ||| (1,[e(1),e(2)])
    XCTAssert(inner_1e0_1e12.1.isEmpty)
    XCTAssertEqual(inner_1e0_1e12.0, 0)
    
    let inner_2e0_5e12:(Double, [e]) = (2, [e(0)]) ||| (5,[e(1),e(2)])
    XCTAssert(inner_1e0_1e12.1.isEmpty)
    XCTAssertEqual(inner_2e0_5e12.0, 0)
    
    let inner_2e10_5e2:(Double, [e]) = (2, [e(1),e(0)]) ||| (5, [e(2)])
    XCTAssert(inner_2e10_5e2.1.isEmpty)
    XCTAssertEqual(inner_2e10_5e2.0, 0)
    
    let inner_2e32_5e01:(Double, [e]) = (2, [e(3),e(2)]) ||| (5, [e(0), e(1)])
    XCTAssert(inner_2e32_5e01.1.isEmpty)
    XCTAssertEqual(inner_2e32_5e01.0, 0)
    
    let inner_2e320_5e1:(Double, [e]) = (2, [e(3),e(2),e(0)]) ||| (5, [e(1)])
    XCTAssert(inner_2e320_5e1.1.isEmpty)
    XCTAssertEqual(inner_2e320_5e1.0, 0)
    
    let inner_1e12_1e12:(Double, [e]) = (1, [e(1),e(2)]) ||| (1, [e(1), e(2)])
    XCTAssert(inner_1e12_1e12.1.isEmpty)
    XCTAssertEqual(inner_1e12_1e12.0, -1)
  }
}

