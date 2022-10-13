import XCTest

final class sandwichProductTests: XCTestCase {
  let basisVectors = [e0, e1, e2, e3,
              e01, e02, e03, e12, e31, e23,
              e021, e013, e032, e123,
              e0123]
  
  func testSandwichProductOfScalars() {
    XCTAssertEqual(10.0 |<*>| 10.0, pow(10.0, 3) )
    XCTAssertEqual(Float.pi |<*>| Float.pi, pow(Float.pi, 3))
  }
  
  func testSandwichProductOfArrayScalars() {
    XCTAssertEqual([10.0] |<*>| [10.0], 10 * 10 * 10)
    XCTAssertEqual([Float.pi] |<*>| [Float.pi], pow(Float.pi, 3))
    
    let a = [2.0, 3.0]
    XCTAssertEqual( a |<*>| a,  pow(a.reduce(1, *), 3.0) )
    
    let b = [Float.pi, 0.5*Float.pi]
    XCTAssertEqual( b |<*>| b, pow(b.reduce(1, *), 3), accuracy:0.001)
    
    let c = [2.0, 3.0, 4.0]
    let d = [5.0, 6.0]
    XCTAssertEqual( c |<*>| d, (c + d + c).reduce(1, *))
  }
  
  func testSandwichProductOfGrade1() {
    let e1_sp_e1_0:(Double, [e]) = e(1) |<*>| e(1)
    XCTAssertEqual(e1_sp_e1_0.0,  1)
    XCTAssertEqual(e1_sp_e1_0.1,  [e(1)])
    
    let const10_sp_e1_0:(Double, [e]) = 10 |<*>| e(1)
    XCTAssertEqual(const10_sp_e1_0.0,  -100)
    XCTAssertEqual(const10_sp_e1_0.1,  [e(1)])
    
    let e2_sp_e2_0:(Double, [e]) = e(2) |<*>| e(2)
    XCTAssertEqual(e2_sp_e2_0.0,  1)
    XCTAssertEqual(e2_sp_e2_0.1,  [e(2)])
    
    let e2_sp_10_0:(Double, [e]) = e(2) |<*>| 10
    XCTAssertEqual(e2_sp_10_0.0,  10)
    XCTAssertEqual(e2_sp_10_0.1,  [])
    
    let e3_sp_e3_0:(Double, [e]) = e(3) |<*>| e(3)
    XCTAssertEqual(e3_sp_e3_0.0,  1)
    XCTAssertEqual(e3_sp_e3_0.1, [e(3)])
    
    let e1_sp_e1 = e1 |<*>| e1
    XCTAssertEqual(e1_sp_e1.0, 1)
    XCTAssertEqual(e1_sp_e1.1,  e1.1)
    
    let e2_sp_e2 = e2 |<*>| e2
    XCTAssertEqual(e2_sp_e2.0,  1)
    XCTAssertEqual(e2_sp_e2.1,  e2.1)
    
    let e3_sp_e3 = e3 |<*>| e3
    XCTAssertEqual(e3_sp_e3.0,  1)
    XCTAssertEqual(e3_sp_e3.1,  e3.1)
    
    let e1_sp_e2 = e1 |<*>| e2
    XCTAssertEqual(e1_sp_e2.0,  -1)
    XCTAssertEqual(e1_sp_e2.1,  e2.1)
    
    let e2_sp_e1 = e2 |<*>| e1
    XCTAssertEqual(e2_sp_e1.0,  -1)
    XCTAssertEqual(e2_sp_e1.1,  e1.1)
    
    let e2_sp_e3 = e2 |<*>| e3
    XCTAssertEqual(e2_sp_e3.0,  -1)
    XCTAssertEqual(e2_sp_e3.1,  e3.1)
    
    let e3_sp_e2 = e3 |<*>| e2
    XCTAssertEqual(e3_sp_e2.0,  -1)
    XCTAssertEqual(e3_sp_e2.1,  e2.1)
    
    let e1_sp_e3 = e1 |<*>| e3
    XCTAssertEqual(e1_sp_e3.0,  -1)
    XCTAssertEqual(e1_sp_e3.1,  e3.1)
    
    let e3_sp_e1 = e3 |<*>| e1
    XCTAssertEqual(e3_sp_e1.0,  -1)
    XCTAssertEqual(e3_sp_e1.1,  e1.1)
  }
  
  func testSandwichProductE0() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e0 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE1() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e1 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e1 -1.0*e1 -1.0*e1 -0.0 -0.0 -0.0 1.0*e1 1.0*e1 -1.0*e1 -0.0 -0.0 -0.0 1.0*e1 -0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE2() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e2 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e2 1.0*e2 -1.0*e2 -0.0 -0.0 -0.0 1.0*e2 -1.0*e2 1.0*e2 -0.0 -0.0 -0.0 1.0*e2 -0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE3() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e3 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e3 -1.0*e3 1.0*e3 -0.0 -0.0 -0.0 -1.0*e3 1.0*e3 1.0*e3 -0.0 -0.0 -0.0 1.0*e3 -0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE01() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e01 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e01 1.0*e01 1.0*e01 1.0*e01 1.0*e02 1.0*e03 1.0*e01 1.0*e01 -1.0*e01 1.0*e012 -1.0*e013 1.0*e023 -1.0*e01 -1.0*e0123"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE02() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e02 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e02 -1.0*e02 1.0*e02 1.0*e01 1.0*e02 1.0*e03 1.0*e02 -1.0*e02 1.0*e02 1.0*e012 -1.0*e013 1.0*e023 -1.0*e02 -1.0*e0123"
    print(result)
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE03() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e03 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e03 1.0*e03 -1.0*e03 1.0*e01 1.0*e02 1.0*e03 -1.0*e03 1.0*e03 1.0*e03 1.0*e012 -1.0*e013 1.0*e023 -1.0*e03 -1.0*e0123"
    print(result)
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE12() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e12 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e12 -1.0*e12 1.0*e12 -0.0 -0.0 -0.0 -1.0*e12 1.0*e12 1.0*e12 -0.0 -0.0 -0.0 1.0*e12 -0.0"
    print(result)
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE31() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e31 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e13 -1.0*e13 1.0*e13 -0.0 -0.0 -0.0 -1.0*e13 1.0*e13 -1.0*e13 -0.0 -0.0 -0.0 -1.0*e13 -0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE23() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e021 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e012 -1.0*e012 1.0*e012 1.0*e01 1.0*e02 1.0*e03 1.0*e012 -1.0*e012 -1.0*e012 1.0*e012 -1.0*e013 1.0*e023 1.0*e012 -1.0*e0123"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE021() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e021 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e012 -1.0*e012 1.0*e012 1.0*e01 1.0*e02 1.0*e03 1.0*e012 -1.0*e012 -1.0*e012 1.0*e012 -1.0*e013 1.0*e023 1.0*e012 -1.0*e0123"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE013() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e013 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e013 -1.0*e013 1.0*e013 1.0*e01 1.0*e02 1.0*e03 1.0*e013 -1.0*e013 1.0*e013 1.0*e012 -1.0*e013 1.0*e023 -1.0*e013 -1.0*e0123"
                print(result)
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE032() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e032 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e023 -1.0*e023 -1.0*e023 1.0*e01 1.0*e02 1.0*e03 -1.0*e023 -1.0*e023 1.0*e023 1.0*e012 -1.0*e013 1.0*e023 1.0*e023 -1.0*e0123"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE123() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e123 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 1.0*e123 1.0*e123 1.0*e123 -0.0 -0.0 -0.0 -1.0*e123 -1.0*e123 -1.0*e123 -0.0 -0.0 -0.0 1.0*e123 -0.0"
    XCTAssertEqual(result, const_ref)
  }
  
  func testSandwichProductE0123() {
    let result = basisVectors.map { pairs in
      pairs |<*>| e0123 |> stringify
    }.joined(separator: " ")
    let const_ref = "0.0 -1.0*e0123 -1.0*e0123 -1.0*e0123 1.0*e01 1.0*e02 1.0*e03 -1.0*e0123 -1.0*e0123 -1.0*e0123 1.0*e012 -1.0*e013 1.0*e023 -1.0*e0123 -1.0*e0123"
    XCTAssertEqual(result, const_ref)
  }
}

