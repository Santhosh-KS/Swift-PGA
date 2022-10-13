import XCTest
//TODO: Inverse operation is not supported yet
/*
final class inverseOperationTests: XCTestCase {
    
  func testInverseOfConstants() {
    let inv_e0 = e0|-||
    XCTAssertEqual(inv_e0.0, 1)
    XCTAssertEqual(inv_e0.1, e(0))
    
    let normalized_inv_e0 = normalized(inv_e0)
    XCTAssertEqual(normalized_inv_e0.0, 1)
    XCTAssertEqual(normalized_inv_e0.1, [e(0)])
    
    let inv_const_10 = 10|-||
    XCTAssertEqual(inv_const_10, 1/10)
    
    let inv_const_0 = 0|-||
    XCTAssertEqual(inv_const_0, 0)
  }
  
  func testInverseOfGrade1() {
    let inv_e1 = e1|-||
    XCTAssertEqual(inv_e1.0, 1)
    XCTAssertEqual(inv_e1.1, e(1))
    
    let normalized_inv_e1 = normalized(inv_e1)
    XCTAssertEqual(normalized_inv_e1.0, 1)
    XCTAssertEqual(normalized_inv_e1.1, [e(1)])
    
    let inv_e2 = e2|-||
    XCTAssertEqual(inv_e2.0, 1)
    XCTAssertEqual(inv_e2.1, e(2))
    
    let normalized_inv_e2 = normalized(inv_e2)
    XCTAssertEqual(normalized_inv_e2.0, 1)
    XCTAssertEqual(normalized_inv_e2.1, [e(2)])
    
    let inv_e3 = e3|-||
    XCTAssertEqual(inv_e3.0, 1)
    XCTAssertEqual(inv_e3.1, e(3))
    
    let normalized_inv_e3 = normalized(inv_e3)
    XCTAssertEqual(normalized_inv_e3.0, 1)
    XCTAssertEqual(normalized_inv_e3.1, [e(3)])
  }
  
  func testInverseOfGrade2() {
    let inv_e12 = e12|-||
    XCTAssertEqual(inv_e12.0, -1)
    XCTAssertEqual(inv_e12.1, [e(1),e(2)])
    
    let normalized_inv_e12 = normalized(inv_e12)
    XCTAssertEqual(normalized_inv_e12.0, -1)
    XCTAssertEqual(normalized_inv_e12.1, [e(1),e(2)])
    
    let inv_e21 = e21|-||
    XCTAssertEqual(inv_e21.0, 1)
    XCTAssertEqual(inv_e21.1, [e(1),e(2)])
    
    let normalized_inv_e21 = normalized(inv_e21)
    XCTAssertEqual(normalized_inv_e21.0, 1)
    XCTAssertEqual(normalized_inv_e21.1, [e(1),e(2)])
    
    let inv_e13 = e13|-||
    XCTAssertEqual(inv_e13.0, -1)
    XCTAssertEqual(inv_e13.1, [e(1),e(3)])
    
    let normalized_inv_e13 = normalized(inv_e13)
    XCTAssertEqual(normalized_inv_e13.0, -1)
    XCTAssertEqual(normalized_inv_e13.1, [e(1),e(3)])
    
    let inv_e31 = e31|-||
    XCTAssertEqual(inv_e31.0, 1)
    XCTAssertEqual(inv_e31.1, [e(1),e(3)])
    
    let normalized_inv_e31 = normalized(inv_e31)
    XCTAssertEqual(normalized_inv_e31.0, 1)
    XCTAssertEqual(normalized_inv_e31.1, [e(1),e(3)])
    
    let inv_e23 = e23|-||
    XCTAssertEqual(inv_e23.0, -1)
    XCTAssertEqual(inv_e23.1, [e(2),e(3)])
    
    let normalized_inv_e23 = normalized(inv_e23)
    XCTAssertEqual(normalized_inv_e23.0, -1)
    XCTAssertEqual(normalized_inv_e23.1, [e(2),e(3)])
    
    let inv_e32 = e32|-||
    XCTAssertEqual(inv_e32.0, 1)
    XCTAssertEqual(inv_e32.1, [e(2),e(3)])
    
    let normalized_inv_e32 = normalized(inv_e32)
    XCTAssertEqual(normalized_inv_e32.0, 1)
    XCTAssertEqual(normalized_inv_e32.1, [e(2),e(3)])
  }
  
  func testInverseOfGrade3() {
    let inv_e123 = e123|-||
    XCTAssertEqual(inv_e123.0, 1)
    XCTAssertEqual(inv_e123.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e123 = normalized(inv_e123)
    XCTAssertEqual(normalized_inv_e123.0, 1)
    XCTAssertEqual(normalized_inv_e123.1, [e(1),e(2), e(3)])
    
    let inv_e213 = e213|-||
    XCTAssertEqual(inv_e213.0, -1)
    XCTAssertEqual(inv_e213.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e213 = normalized(inv_e213)
    XCTAssertEqual(normalized_inv_e213.0, -1)
    XCTAssertEqual(normalized_inv_e213.1, [e(1),e(2), e(3)])
    
    let inv_e132 = e132|-||
    XCTAssertEqual(inv_e132.0, -1)
    XCTAssertEqual(inv_e132.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e132 = normalized(inv_e132)
    XCTAssertEqual(normalized_inv_e132.0, -1)
    XCTAssertEqual(normalized_inv_e132.1, [e(1),e(2), e(3)])
    
    let inv_e312 = e312|-||
    XCTAssertEqual(inv_e312.0, 1)
    XCTAssertEqual(inv_e312.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e312 = normalized(inv_e312)
    XCTAssertEqual(normalized_inv_e312.0, 1)
    XCTAssertEqual(normalized_inv_e312.1, [e(1),e(2), e(3)])
    
    let inv_e231 = e231|-||
    XCTAssertEqual(inv_e231.0, 1)
    XCTAssertEqual(inv_e231.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e231 = normalized(inv_e231)
    XCTAssertEqual(normalized_inv_e231.0, 1)
    XCTAssertEqual(normalized_inv_e231.1, [e(1),e(2), e(3)])
    
    let inv_e321 = e321|-||
    XCTAssertEqual(inv_e321.0, -1)
    XCTAssertEqual(inv_e321.1, [e(1),e(2), e(3)])
    
    let normalized_inv_e321 = normalized(inv_e321)
    XCTAssertEqual(normalized_inv_e321.0, -1)
    XCTAssertEqual(normalized_inv_e321.1, [e(1),e(2), e(3)])
  }
  
  func testInverseProperty() {
      // A |*| A|-|| = 1
      // i.e A * Inverse(A) = 1
    let ten:Double = 10
    let ten_inv = Inverse(of: ten)
    XCTAssertEqual(ten |*| ten_inv, 1)
    
    let pi = Float.pi
    let pi_inv = Inverse(of: pi)
    XCTAssertEqual(pi |*| pi_inv, 1)
    
    let e0_inv = Inverse(of: e0)
    XCTAssertEqual((e0 |*| e0_inv).0, 1)
    XCTAssertEqual((e0 |*| e0_inv).1, [])
    
    let e1_inv = Inverse(of: e1)
    XCTAssertEqual((e1 |*| e1_inv).0, 1)
    XCTAssertEqual((e1 |*| e1_inv).1, [])
    let e2_inv = Inverse(of: e2)
    XCTAssertEqual((e2 |*| e2_inv).0, 1)
    XCTAssertEqual((e2 |*| e2_inv).1, [])
    let e3_inv = Inverse(of: e3)
    XCTAssertEqual((e3 |*| e3_inv).0, 1)
    XCTAssertEqual((e3 |*| e3_inv).1, [])
    
    let e12_inv = Inverse(of: e12)
    XCTAssertEqual((e12 |*| e12_inv).first!.0, 1)
    XCTAssertEqual((e12 |*| e12_inv).first!.1, [])
    let e21_inv = e21|-||
    XCTAssertEqual((e21 |*| e21_inv).first!.0, 1)
    XCTAssertEqual((e21 |*| e21_inv).first!.1, [])
    let e13_inv = e13|-||
    XCTAssertEqual((e13 |*| e13_inv).first!.0, 1)
    XCTAssertEqual((e13 |*| e13_inv).first!.1, [])
    let e31_inv = Inverse(of: e31)
    XCTAssertEqual((e31 |*| e31_inv).first!.0, 1)
    XCTAssertEqual((e31 |*| e31_inv).first!.1, [])
    let e23_inv = Inverse(of: e23)
    XCTAssertEqual((e23 |*| e23_inv).first!.0, 1)
    XCTAssertEqual((e23 |*| e23_inv).first!.1, [])
    let e32_inv = e32|-||
    XCTAssertEqual((e32 |*| e32_inv).first!.0, 1)
    XCTAssertEqual((e32 |*| e32_inv).first!.1, [])
    
    let e123_inv = Inverse(of: e123)
    XCTAssertEqual((e123 |*| e123_inv).first!.0, 1)
    XCTAssertEqual((e123 |*| e123_inv).first!.1, [])
    let e213_inv = e213|-||
    XCTAssertEqual((e213 |*| e213_inv).first!.0, 1)
    XCTAssertEqual((e213 |*| e213_inv).first!.1, [])
    let e132_inv = e132|-||
    XCTAssertEqual((e132 |*| e132_inv).first!.0, 1)
    XCTAssertEqual((e132 |*| e132_inv).first!.1, [])
    let e312_inv = Inverse(of: e312)
    XCTAssertEqual((e312 |*| e312_inv).first!.0, 1)
    XCTAssertEqual((e312 |*| e312_inv).first!.1, [])
    let e231_inv = Inverse(of: e231)
    XCTAssertEqual((e231 |*| e231_inv).first!.0, 1)
    XCTAssertEqual((e231 |*| e231_inv).first!.1, [])
    let e321_inv = e321|-||
    XCTAssertEqual((e321 |*| e321_inv).first!.0, 1)
    XCTAssertEqual((e321 |*| e321_inv).first!.1, [])
    
  }
  
  func testInversePropertyOnEpsilonsWithCoefficients() {
    let e1_inv = Inverse(of: (2.0 |*| e1))
    XCTAssertEqual((e1 |*| e1_inv).0, 1/2)
    XCTAssertEqual((e1 |*| e1_inv).1, [])
  }
}
*/
