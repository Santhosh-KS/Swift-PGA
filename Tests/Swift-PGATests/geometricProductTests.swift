import XCTest

final class geometricProductTests: XCTestCase  {
  
  func testScalarMulGrade1() {
    let e4 = e(4) |*| 1234
    XCTAssertEqual(e4.0, 1234)
    XCTAssertEqual(e4.1, [e(4)])
    
    let e5 =  5678 |*| e(5)
    XCTAssertEqual(e5.0, 5678)
    XCTAssertEqual(e5.1, [e(5)])
  }
 
  func testGrade1MulGrade1WithCoefficents() {
    
    let mul_1e0_2e0:(Double, [e]) = (1, e(0)) |*| (2, e(0))
    XCTAssertEqual(mul_1e0_2e0.0, 0)
    XCTAssertEqual(mul_1e0_2e0.1.first, nil)

    let mul_2e1_3e1:(Double, [e]) = (2, e(1)) |*| (3, e(1))
    XCTAssertEqual(mul_2e1_3e1.0, 6)
    XCTAssertEqual(mul_2e1_3e1.1.first, nil)
    
    let mul_3e2_4e2:(Double, [e]) = (3, e(2)) |*| (-4, e(2))
    XCTAssertEqual(mul_3e2_4e2.0, -12)
    XCTAssertEqual(mul_3e2_4e2.1.first, nil)
    
    let mul_2e1_2e2:(Double, [e]) = (2, e(1)) |*| (-2, e(2))
    XCTAssertEqual(mul_2e1_2e2.0, -4)
    XCTAssertEqual(mul_2e1_2e2.1, [e(1),e(2)])
    
    let mul_2e2_2e1:(Double, [e]) = (2, e(2)) |*| (2, e(1))
    XCTAssertEqual(mul_2e2_2e1.0, -4)
    XCTAssertEqual(mul_2e2_2e1.1, [e(1),e(2)])
    
    let mul_2e2_minus2e1:(Double, [e]) = (2, e(2)) |*| (-2, e(1))
    XCTAssertEqual(mul_2e2_minus2e1.0, 4)
    XCTAssertEqual(mul_2e2_minus2e1.1, [e(1),e(2)])
  }
 
  func testGrade1MulGrade1() {
    let inner_e0:(Double,[e]) = e(0) ||| e(0)
    XCTAssertEqual(inner_e0.0, 0)
    let inner_e1:(Double,[e]) = e(1) ||| e(1)
    XCTAssertEqual(inner_e1.0, 1)
    let inner_e2:(Double,[e]) = e(2) ||| e(2)
    XCTAssertEqual(inner_e2.0, 1)
    let inner_e12:(Double,[e]) = e(1) ||| e(2)
    XCTAssertEqual(inner_e12.0, 0)
    
    let outer_e0:(Double, [e]) = e(0) |^| e(0)
    XCTAssertEqual(outer_e0.0, 1)
    XCTAssertEqual(outer_e0.1.first, nil)
    
    let outer_e1:(Double, [e]) = e(1) |^| e(1)
    XCTAssertEqual(outer_e1.0, 1)
    XCTAssertEqual(outer_e1.1.first, nil)
    
    let outer_e2:(Double, [e]) = e(2) |^| e(2)
    XCTAssertEqual(outer_e2.0, 1)
    XCTAssertEqual(outer_e2.1.first, nil)
    
    let outer_e12:(Double, [e]) = e(1) |^| e(2)
    XCTAssertEqual(outer_e12.0, 1)
    XCTAssertEqual(outer_e12.1, [e(1),e(2)])
    
    let outer_e21:(Double, [e]) = e(2) |^| e(1)
    XCTAssertEqual(outer_e21.0, -1)
    XCTAssertEqual(outer_e21.1, [e(1),e(2)])
    
    
    let mul_e0:(Double, [e]) = e(0) |*| e(0)
    XCTAssertEqual(mul_e0.0, 0)
    XCTAssertEqual(mul_e0.1.first, nil)
   
    let mul_e1:(Double, [e]) = e(1) |*| e(1)
    XCTAssertEqual(mul_e1.0, 1)
    XCTAssertEqual(mul_e1.1.first, nil)
    
    let mul_e2:(Double, [e]) = e(2) |*| e(2)
    XCTAssertEqual(mul_e2.0, 1)
    XCTAssertEqual(mul_e2.1.first, nil)
    
    let mul_e12:(Double, [e]) = e(1) |*| e(2)
    XCTAssertEqual(mul_e12.0, 1)
    XCTAssertEqual(mul_e12.1, [e(1),e(2)])
    
    let mul_e21:(Double, [e]) = e(2) |*| e(1)
    XCTAssertEqual(mul_e21.0, -1)
    XCTAssertEqual(mul_e21.1, [e(1),e(2)])
  }

  func testGrade2MulGrade1() {
    let outer_1e0_1e0 = (1, e(0)) |*| (1, [e(0)])
    XCTAssertEqual(outer_1e0_1e0.0, 0)
    XCTAssertEqual(outer_1e0_1e0.1, [])
    
    let outer_1e0_1e0_rhs = (1, [e(0)]) |*| (1, e(0))
    XCTAssertEqual(outer_1e0_1e0_rhs.0, 0)
    XCTAssertEqual(outer_1e0_1e0_rhs.1, [])
    
    let outer_1e00_1e0 = (1, [e(0),e(0)]) |*| (1, e(0))
    XCTAssertEqual(outer_1e00_1e0.0, 0)
    XCTAssertEqual(outer_1e00_1e0.1, [])

    
    let outer_1e1_1e1 = (1, [e(1)]) |*| (1, e(1))
    XCTAssertEqual(outer_1e1_1e1.1, [])
    XCTAssertEqual(outer_1e1_1e1.0, 1)
    
    let outer_1e1_1e1_rev = (1, e(1)) |*| (1, [e(1)])
    XCTAssertEqual(outer_1e1_1e1_rev.1, [])
    XCTAssertEqual(outer_1e1_1e1_rev.0, 1)
    
    let outer_1e01_1e1 = (1, [e(0),e(1)]) |*| (1, e(1))
    XCTAssertEqual(outer_1e01_1e1.1, [e(0)])
    XCTAssertEqual(outer_1e01_1e1.0, 1)
    
    let outer_1e01_1e1_rev = (1, e(1)) |*| (1, [e(0),e(1)])
    XCTAssertEqual(outer_1e01_1e1_rev.1, [e(0)])
    XCTAssertEqual(outer_1e01_1e1_rev.0, -1)
    
    let outer_1e12_1e1 = (1, [e(1),e(2)]) |*| (1, e(1))
    XCTAssertEqual(outer_1e12_1e1.0, -1) // Sign change
    XCTAssertEqual(outer_1e12_1e1.1, [e(2)])
    
    let outer_1e12_1e1_rev = (1, e(1)) |*| (1, [e(1),e(2)])
    XCTAssertEqual(outer_1e12_1e1_rev.0, 1)
    XCTAssertEqual(outer_1e12_1e1_rev.1, [e(2)])
    
    let outer_1e1_1e12 = (1, e(1)) |*| (1,[e(1),e(2)])
    XCTAssertEqual(outer_1e1_1e12.0, 1)
    XCTAssertEqual(outer_1e1_1e12.1, [e(2)])
    
    let outer_1e1_1e12_rev = (1,[e(1),e(2)]) |*| (1, e(1))
    XCTAssertEqual(outer_1e1_1e12_rev.0, -1) // Sign change
    XCTAssertEqual(outer_1e1_1e12_rev.1, [e(2)])
    
    let outer_1e1_1e21 = (1, e(1)) |*| (1,[e(2),e(1)])
    XCTAssertEqual(outer_1e1_1e21.0, -1)
    XCTAssertEqual(outer_1e1_1e21.1, [e(2)])
    
    let outer_1e1_1e21_rev = (1,[e(2),e(1)]) |*| (1, e(1))
    XCTAssertEqual(outer_1e1_1e21_rev.0, 1)
    XCTAssertEqual(outer_1e1_1e21_rev.1, [e(2)])
    
    let outer_1e0_1e12 = (1, e(0)) |*| (1,[e(1),e(2)])
    XCTAssertEqual(outer_1e0_1e12.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12.0, 1)
    
    let outer_1e0_1e12_rev = (1,[e(1),e(2)]) |*| (1, e(0))
    XCTAssertEqual(outer_1e0_1e12_rev.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12_rev.0, 1)
    
    let outer_2e0_5e12 = (2, e(0)) |*| (5,[e(1),e(2)])
    XCTAssertEqual(outer_2e0_5e12.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12.0, 10)
    
    let outer_2e0_5e12_rev = (5,[e(1),e(2)]) |*| (2, e(0))
    XCTAssertEqual(outer_2e0_5e12_rev.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12_rev.0, 10)
    
    let outer_2e10_5e2 = (5, e(2)) |*| (2, [e(1),e(0)])
    XCTAssertEqual(outer_2e10_5e2.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2.0, -10)
    
    let outer_2e10_5e2_rev = (2, [e(1),e(0)]) |*| (5, e(2))
    XCTAssertEqual(outer_2e10_5e2_rev.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2_rev.0, -10)
    
    let outer_2e320_5e1 = (2, [e(3),e(2),e(0)]) |*| (5, e(1))
    XCTAssertEqual(outer_2e320_5e1.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1.0, -10)
    
    let outer_2e320_5e1_rev = (5, e(1)) |*| (2, [e(3),e(2),e(0)])
    XCTAssertEqual(outer_2e320_5e1_rev.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1_rev.0, 10)
  }
  
  func testGrade2MulGrade2() {
    let outer_1e0_1e0 = (1, [e(0)]) |*| (1, [e(0)])
    XCTAssertEqual(outer_1e0_1e0.0, 0)
    XCTAssertEqual(outer_1e0_1e0.1, [])
    
    let outer_1e00_1e00 = (1, [e(0),e(0)]) |*| (1, [e(0),e(0)])
    XCTAssertEqual(outer_1e00_1e00.0, 0)
    XCTAssertEqual(outer_1e00_1e00.1, [])
    
    
    let outer_1e1_1e1 = (1, [e(1)]) |*| (1, [e(1)])
    XCTAssertEqual(outer_1e1_1e1.0, 1)
    XCTAssertEqual(outer_1e1_1e1.1, [])
    
    let outer_1e01_1e1 = (1, [e(0),e(1)]) |*| (1, [e(1)])
    XCTAssertEqual(outer_1e01_1e1.1, [e(0)])
    XCTAssertEqual(outer_1e01_1e1.0, 1)
    
    let outer_1e12_1e1 = (1, [e(1),e(2)]) |*| (1, [e(1)])
    XCTAssertEqual(outer_1e12_1e1.0, -1)
    XCTAssertEqual(outer_1e12_1e1.1, [e(2)])
    
    let outer_1e1_1e12 = (1, [e(1)]) |*| (1,[e(1),e(2)])
    XCTAssertEqual(outer_1e1_1e12.0, 1)
    XCTAssertEqual(outer_1e1_1e12.1, [e(2)])
    
    let outer_1e1_1e21 = (1, [e(1)]) |*| (1,[e(2),e(1)])
    XCTAssertEqual(outer_1e1_1e21.0, -1)
    XCTAssertEqual(outer_1e1_1e21.1, [e(2)])
    
    let outer_1e0_1e12 = (1, [e(0)]) |*| (1,[e(1),e(2)])
    
    XCTAssertEqual(outer_1e0_1e12.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_1e0_1e12.0, 1)
    
    let outer_2e0_5e12 = (2, [e(0)]) |*| (5,[e(1),e(2)])
    
    XCTAssertEqual(outer_2e0_5e12.1, [e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e0_5e12.0, 10)
    
    let outer_2e10_5e2 = (2, [e(1),e(0)]) |*| (5, [e(2)])
    XCTAssertEqual(outer_2e10_5e2.1, [ e(0), e(1), e(2)])
    XCTAssertEqual(outer_2e10_5e2.0, -10)
    
    let outer_2e32_5e01 = (2, [e(3),e(2)]) |*| (5, [e(0), e(1)])
    XCTAssertEqual(outer_2e32_5e01.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e32_5e01.0, -10)
    
    let outer_2e320_5e1 = (2, [e(3),e(2),e(0)]) |*| (5, [e(1)])
    XCTAssertEqual(outer_2e320_5e1.1, [e(0), e(1), e(2), e(3)])
    XCTAssertEqual(outer_2e320_5e1.0, -10)
  }

}

