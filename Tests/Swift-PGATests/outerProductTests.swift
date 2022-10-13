import XCTest

final class outerProductTests: XCTestCase  {
  func testScalarOuterProdGrade1() {
    let e2 = e(2) |^| 22
    XCTAssertEqual(e2.0, 22)
    XCTAssertEqual(e2.1, e(2))
    
    let e3 =  22 |^| e(3)
    XCTAssertEqual(e3.0, 22)
    XCTAssertEqual(e3.1, e(3))
  }
  
  func testGrade1OuterProdGrade1WithCoefficents() {
    let outer_e0:(Double, [e]) = (1, e(0)) |^| (1, e(0))
    XCTAssertEqual(outer_e0.0, 1)
    
    let outer_10e0:(Double, [e]) = (10, e(0)) |^| (10, e(0))
    XCTAssertEqual(outer_10e0.0, 100)
    XCTAssertEqual(outer_10e0.1.first, nil)
    
    let outer_10e1_2e1:(Double, [e]) = (10, e(1)) |^| (2, e(1))
    XCTAssertEqual(outer_10e1_2e1.0, 20)
    XCTAssertEqual(outer_10e1_2e1.1.first, nil)
    
    let outer_5e2_2e2:(Double, [e]) = (5, e(2)) |^| (2, e(2))
    XCTAssertEqual(outer_5e2_2e2.0, 10)
    XCTAssertEqual(outer_5e2_2e2.1.first, nil)
    
    let outer_5e1_2e2:(Double, [e]) = (5, e(1)) |^| (2, e(2))
    XCTAssertEqual(outer_5e1_2e2.0, 10)
    XCTAssertEqual(outer_5e1_2e2.1, [e(1),e(2)])
    
    let outer_5e2_2e1:(Double, [e]) = (5, e(2)) |^| (2, e(1))
    XCTAssertEqual(outer_5e2_2e1.0, -10)
    XCTAssertEqual(outer_5e2_2e1.1, [e(1),e(2)])
  }
  
  func testGrade2OuterProdGrade1() {
    let outer_1e0_1e0:(Double, [e]) = (1, [e(0)]) |^| (1, e(0))
    XCTAssert(outer_1e0_1e0.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e0.0, 0)
    
    let outer_1e0_1e0_rev:(Double, [e]) = (1, e(0)) |^| (1, [e(0)])
    XCTAssert(outer_1e0_1e0_rev.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e0_rev.0, 0)
    
    let outer_1e1_1e1:(Double, [e]) = (1, [e(1)]) |^| (1, e(1))
    XCTAssert(outer_1e1_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e1.0, 0)
    
    let outer_1e1_1e1_rev:(Double, [e]) = (1, e(1)) |^| (1, [e(1)])
    XCTAssert(outer_1e1_1e1_rev.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e1_rev.0, 0)
    
    let outer_1e01_1e1:(Double, [e]) = (1, [e(0),e(1)]) |^| (1, e(1))
    XCTAssert(outer_1e01_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e01_1e1.0, 0)
    
    let outer_1e01_1e1_rev:(Double, [e]) = (1, e(1)) |^| (1, [e(0),e(1)])
    XCTAssert(outer_1e01_1e1_rev.1.isEmpty)
    XCTAssertEqual(outer_1e01_1e1_rev.0, 0)
    
    let outer_1e12_1e1:(Double, [e]) = (1, [e(1),e(2)]) |^| (1, e(1))
    XCTAssert(outer_1e12_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e12_1e1.0, 0)
    
    let outer_1e12_1e1_rev:(Double, [e]) = (1, e(1)) |^| (1, [e(1),e(2)])
    XCTAssert(outer_1e12_1e1_rev.1.isEmpty)
    XCTAssertEqual(outer_1e12_1e1_rev.0, 0)
    
    let outer_1e1_1e12:(Double, [e]) = (1, e(1)) |^| (1,[e(1),e(2)])
    XCTAssert(outer_1e1_1e12.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e12.0, 0)
    
    let outer_1e1_1e12_rev:(Double, [e]) = (1,[e(1),e(2)]) |^| (1, e(1))
    XCTAssert(outer_1e1_1e12_rev.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e12_rev.0, 0)
    
    let outer_1e1_1e21:(Double, [e]) = (1, e(1)) |^| (1,[e(2),e(1)])
    XCTAssert(outer_1e1_1e21.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e21.0, 0)
    
    let outer_1e1_1e21_rev:(Double, [e]) = (1,[e(2),e(1)]) |^| (1, e(1))
    XCTAssert(outer_1e1_1e21_rev.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e21_rev.0, 0)
    
    let outer_1e0_1e12:(Double, [e]) = (1, e(0)) |^| (1,[e(1),e(2)])
    XCTAssert(!outer_1e0_1e12.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e12.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12.0, 1)
    
    let outer_1e0_1e12_rev:(Double, [e]) = (1,[e(1),e(2)]) |^| (1, e(0))
    XCTAssert(!outer_1e0_1e12_rev.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e12_rev.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12_rev.0, 1)
    
    let outer_2e0_5e12:(Double, [e]) = (2, e(0)) |^| (5,[e(1),e(2)])
    XCTAssert(!outer_1e0_1e12.1.isEmpty)
    XCTAssertEqual(outer_2e0_5e12.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12.0, 10)
    
    let outer_2e0_5e12_rev:(Double, [e]) = (5,[e(1),e(2)]) |^| (2, e(0))
    XCTAssert(!outer_2e0_5e12_rev.1.isEmpty)
    XCTAssertEqual(outer_2e0_5e12_rev.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12_rev.0, 10)
    
    let outer_2e10_5e2:(Double, [e]) = (2, [e(1),e(0)]) |^| (5, e(2))
    XCTAssert(!outer_2e10_5e2.1.isEmpty)
    XCTAssertEqual(outer_2e10_5e2.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2.0, -10)
    
    let outer_2e10_5e2_rev:(Double, [e]) = (5, e(2)) |^| (2, [e(1),e(0)])
    XCTAssert(!outer_2e10_5e2_rev.1.isEmpty)
    XCTAssertEqual(outer_2e10_5e2_rev.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2_rev.0, -10)
    
    let outer_2e320_5e1:(Double, [e]) = (2, [e(3),e(2),e(0)]) |^| (5, e(1))
    XCTAssert(!outer_2e320_5e1.1.isEmpty)
    XCTAssertEqual(outer_2e320_5e1.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1.0, -10)
    
    let outer_2e320_5e1_rev:(Double, [e]) = (5, e(1)) |^| (2, [e(3),e(2),e(0)])
    XCTAssert(!outer_2e320_5e1_rev.1.isEmpty)
    XCTAssertEqual(outer_2e320_5e1_rev.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1_rev.0, 10)
  }
  
  func testGrade2OuterProdGrade2() {
    let outer_1e0_1e0:(Double, [e]) = (1, [e(0)]) |^| (1, [e(0)])
    XCTAssert(outer_1e0_1e0.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e0.0, 0)
    
    let outer_1e1_1e1:(Double, [e]) = (1, [e(1)]) |^| (1, [e(1)])
    XCTAssert(outer_1e1_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e1.0, 0)
    
    let outer_1e01_1e1:(Double, [e]) = (1, [e(0),e(1)]) |^| (1, [e(1)])
    XCTAssert(outer_1e01_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e01_1e1.0, 0)
    
    let outer_1e12_1e1:(Double, [e]) = (1, [e(1),e(2)]) |^| (1, [e(1)])
    XCTAssert(outer_1e12_1e1.1.isEmpty)
    XCTAssertEqual(outer_1e12_1e1.0, 0)
    
    let outer_1e1_1e12:(Double, [e]) = (1, [e(1)]) |^| (1,[e(1),e(2)])
    XCTAssert(outer_1e1_1e12.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e12.0, 0)
    
    let outer_1e1_1e21:(Double, [e]) = (1, [e(1)]) |^| (1,[e(2),e(1)])
    XCTAssert(outer_1e1_1e21.1.isEmpty)
    XCTAssertEqual(outer_1e1_1e21.0, 0)
    
    let outer_1e0_1e12:(Double, [e]) = (1, [e(0)]) |^| (1,[e(1),e(2)])
    XCTAssert(!outer_1e0_1e12.1.isEmpty)
    XCTAssertEqual(outer_1e0_1e12.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12.0, 1)
    
    let outer_2e0_5e12:(Double, [e]) = (2, [e(0)]) |^| (5,[e(1),e(2)])
    XCTAssert(!outer_1e0_1e12.1.isEmpty)
    XCTAssertEqual(outer_2e0_5e12.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12.0, 10)
    
    let outer_2e10_5e2:(Double, [e]) = (2, [e(1),e(0)]) |^| (5, [e(2)])
    XCTAssert(!outer_2e10_5e2.1.isEmpty)
    XCTAssertEqual(outer_2e10_5e2.1, [e(0),e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2.0, -10)
    
    let outer_2e32_5e01:(Double, [e]) = (2, [e(3),e(2)]) |^| (5, [e(0), e(1)])
    XCTAssert(!outer_2e32_5e01.1.isEmpty)
    XCTAssertEqual(outer_2e32_5e01.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e32_5e01.0, -10)
    
    let outer_2e320_5e1:(Double, [e]) = (2, [e(3),e(2),e(0)]) |^| (5, [e(1)])
    XCTAssert(!outer_2e320_5e1.1.isEmpty)
    XCTAssertEqual(outer_2e320_5e1.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1.0, -10)
  }
}

