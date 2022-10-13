import XCTest

final class regressiveProductTests: XCTestCase {
  
  func testRegressiveProductOfScalarsAndgrade1() {
    let rp_10 = 10 |^*| 10
    XCTAssertEqual(rp_10, 10*10)

    let rp_e0 = e0 |^*| e0
    XCTAssertEqual(rp_e0.0, 0)

    let rp_pi = Float.pi |^*| Float.pi
    XCTAssertEqual(rp_pi, Float.pi * Float.pi)
    
    let rp_e1 = e1 |^*| e1
    XCTAssertEqual(rp_e1.0, 0)
    XCTAssertEqual(rp_e1.1, [])
    
    let rp_e2 = e2 |^*| e2
    XCTAssertEqual(rp_e2.0, 0)
    XCTAssertEqual(rp_e2.1, [])
    
    let rp_e3 = e3 |^*| e3
    XCTAssertEqual(rp_e3.0, 0)
    XCTAssertEqual(rp_e3.1, [])
  }
  
  func testRegressivewithE0_E0123() {
    let e0_e123 = e(0) |^*| e123
    XCTAssertEqual(e0_e123.0, -1)
    XCTAssertEqual(e0_e123.1, [])
    
    let e0_e0123 = e(0) |^*| e0123
    XCTAssertEqual(e0_e0123.0, -1)
    XCTAssertEqual(e0_e0123.1, e0.1)
    
    let e123_e0 = e123 |^*| e0
    XCTAssertEqual(e123_e0.0, -1)
    XCTAssertEqual(e123_e0.1, [])
    
    let e0123_e0 = e0123 |^*| e0
    XCTAssertEqual(e0123_e0.0, -1)
    XCTAssertEqual(e0123_e0.1, e0.1)
  }
  
  func testRegressivewithE1_E032_E0123() {
    let e1_e032 = e1 |^*| e032
    XCTAssertEqual(e1_e032.0, 1)
    XCTAssertEqual(e1_e032.1, [])
    
    let e032_e1 = e032 |^*| e1
    XCTAssertEqual(e032_e1.0, -1)
    XCTAssertEqual(e032_e1.1, [])
    
    let e1_e0123 = e1 |^*| e0123
    XCTAssertEqual(e1_e0123.0, -1)
    XCTAssertEqual(e1_e0123.1, e1.1)
    
    let e0123_e1 = e0123 |^*| e1
    XCTAssertEqual(e0123_e1.0, -1)
    XCTAssertEqual(e0123_e1.1, e1.1)
  }
  
  func testRegressivewithE2_E013_E0123() {
    let e2_e013 = e2 |^*| e013
    XCTAssertEqual(e2_e013.0, 1)
    XCTAssertEqual(e2_e013.1, [])
    
    let e013_e2 = e013 |^*| e2
    XCTAssertEqual(e013_e2.0, -1)
    XCTAssertEqual(e013_e2.1, [])
    
    let e2_e0123 = e2 |^*| e0123
    XCTAssertEqual(e2_e0123.0, -1)
    XCTAssertEqual(e2_e0123.1, e2.1)
    
    let e0123_e2 = e0123 |^*| e2
    XCTAssertEqual(e0123_e2.0, -1)
    XCTAssertEqual(e0123_e2.1, e2.1)
  }
  
  func testRegressivewithE3_E021_E0123() {
    let e3_e021 = e3 |^*| e021
    XCTAssertEqual(e3_e021.0, 1)
    XCTAssertEqual(e3_e021.1, [])
    
    let e021_e3 = e021 |^*| e3
    XCTAssertEqual(e021_e3.0, -1)
    XCTAssertEqual(e021_e3.1, [])
    
    let e3_e0123 = e3 |^*| e0123
    XCTAssertEqual(e3_e0123.0, -1)
    XCTAssertEqual(e3_e0123.1, e3.1)
    
    let e0123_e3 = e0123 |^*| e3
    XCTAssertEqual(e0123_e3.0, -1)
    XCTAssertEqual(e0123_e3.1, e3.1)
  }
  
  func testRegressivewithE01_E23_E032_E123_E0123() {
    let e01_e23 = e01 |^*| e23
    XCTAssertEqual(e01_e23.0, 1)
    XCTAssertEqual(e01_e23.1, [])
    
    let e23_e01 = e23 |^*| e01
    XCTAssertEqual(e23_e01.0, 1)
    XCTAssertEqual(e23_e01.1, [])
    
    let e01_e032 = e01 |^*| e032
    XCTAssertEqual(e01_e032.0, 1)
    XCTAssertEqual(e01_e032.1, e0.1)
    
    let e032_e01 = e032 |^*| e01
    XCTAssertEqual(e032_e01.0, 1)
    XCTAssertEqual(e032_e01.1, e0.1)
    
    let e01_e0123 = e01 |^*| e0123
    XCTAssertEqual(e01_e0123.0, 1)
    XCTAssertEqual(e01_e0123.1, e01.1)
    
    let e0123_e01 = e0123 |^*| e01
    XCTAssertEqual(e0123_e01.0, 1)
    XCTAssertEqual(e0123_e01.1, e01.1)
  }
  
  func testRegressivewithE02_E31_E013_E123_E0123() {
    let e02_e31 = e02 |^*| e31
    XCTAssertEqual(e02_e31.0, 1)
    XCTAssertEqual(e02_e31.1, [])
    
    let e31_e02 = e31 |^*| e02
    XCTAssertEqual(e31_e02.0, 1)
    XCTAssertEqual(e31_e02.1, [])
    
    let e02_e013 = e02 |^*| e013
    XCTAssertEqual(e02_e013.0, 1)
    XCTAssertEqual(e02_e013.1, e0.1)
    
    let e013_e02 = e013 |^*| e02
    XCTAssertEqual(e013_e02.0, 1)
    XCTAssertEqual(e013_e02.1, e0.1)
    
    let e02_e0123 = e02 |^*| e0123
    XCTAssertEqual(e02_e0123.0, 1)
    XCTAssertEqual(e02_e0123.1, e02.1)
    
    let e0123_e02 = e0123 |^*| e02
    XCTAssertEqual(e0123_e02.0, 1)
    XCTAssertEqual(e0123_e02.1, e02.1)
  }
  
  func testRegressivewithE03_E12_E021_E123_E0123() {
    let e03_e12 = e03 |^*| e12
    XCTAssertEqual(e03_e12.0, 1)
    XCTAssertEqual(e03_e12.1, [])
    
    let e12_e03 = e12 |^*| e03
    XCTAssertEqual(e12_e03.0, 1)
    XCTAssertEqual(e12_e03.1, [])
    
    let e03_e021 = e03 |^*| e021
    XCTAssertEqual(e03_e021.0, 1)
    XCTAssertEqual(e03_e021.1, e0.1)
    
    let e021_e03 = e021 |^*| e03
    XCTAssertEqual(e021_e03.0, 1)
    XCTAssertEqual(e021_e03.1, e0.1)
    
    let e03_e0123 = e03 |^*| e0123
    XCTAssertEqual(e03_e0123.0, 1)
    XCTAssertEqual(e03_e0123.1, e03.1)
    
    let e0123_e03 = e0123 |^*| e03
    XCTAssertEqual(e0123_e03.0, 1)
    XCTAssertEqual(e0123_e03.1, e03.1)
  }
  
  func testRegressivewithE12_E03_E013_E032_E0123() {
    let e12_e03 = e12 |^*| e03
    XCTAssertEqual(e12_e03.0, 1)
    XCTAssertEqual(e12_e03.1, [])
    
    let e03_e12 = e03 |^*| e12
    XCTAssertEqual(e03_e12.0, 1)
    XCTAssertEqual(e03_e12.1, [])
    
    let e12_e013 = e12 |^*| e013
    XCTAssertEqual(e12_e013.0, 1)
    XCTAssertEqual(e12_e013.1, e1.1)
    
    let e013_e12 = e013 |^*| e12
    XCTAssertEqual(e013_e12.0, 1)
    XCTAssertEqual(e013_e12.1, e1.1)
    
    let e12_e0123 = e12 |^*| e0123
    XCTAssertEqual(e12_e0123.0, 1)
    XCTAssertEqual(e12_e0123.1, e12.1)
    
    let e0123_e12 = e0123 |^*| e12
    XCTAssertEqual(e0123_e12.0, 1)
    XCTAssertEqual(e0123_e12.1, e12.1)
  }
  
  func testRegressivewithE31_E02_E021_E032_E0123() {
    let e31_e02 = e31 |^*| e02
    XCTAssertEqual(e31_e02.0, 1)
    XCTAssertEqual(e31_e02.1, [])
    
    let e02_e31 = e02 |^*| e31
    XCTAssertEqual(e02_e31.0, 1)
    XCTAssertEqual(e02_e31.1, [])
    
    let e31_e021 = e31 |^*| e021
    XCTAssertEqual(e31_e021.0, -1)
    XCTAssertEqual(e31_e021.1, e1.1)
    
    let e021_e31 = e021 |^*| e31
    XCTAssertEqual(e021_e31.0, -1)
    XCTAssertEqual(e021_e31.1, e1.1)
    
    let e032_e31 = e032 |^*| e31
    XCTAssertEqual(e032_e31.0, 1)
    XCTAssertEqual(e032_e31.1, e3.1)
    
    let e31_e032 = e31 |^*| e032
    XCTAssertEqual(e31_e032.0, 1)
    XCTAssertEqual(e31_e032.1, e3.1)
    
    let e31_e0123 = e31 |^*| e0123
    XCTAssertEqual(e31_e0123.0, -1)
    XCTAssertEqual(e31_e0123.1, e31.1)
    
    let e0123_e31 = e0123 |^*| e31
    XCTAssertEqual(e0123_e31.0, -1)
    XCTAssertEqual(e0123_e31.1, e31.1)
  }
  
  func testRegressivewithE23_E01_E021_E013_E0123() {
    let e23_e01 = e23 |^*| e01
    XCTAssertEqual(e23_e01.0, 1)
    XCTAssertEqual(e23_e01.1, [])
    
    let e01_e23 = e01 |^*| e23
    XCTAssertEqual(e01_e23.0, 1)
    XCTAssertEqual(e01_e23.1, [])
    
    let e23_e021 = e23 |^*| e021
    XCTAssertEqual(e23_e021.0, 1)
    XCTAssertEqual(e23_e021.1, e2.1)
    
    let e021_e23 = e021 |^*| e23
    XCTAssertEqual(e021_e23.0, 1)
    XCTAssertEqual(e021_e23.1, e2.1)
    
    let e013_e23 = e013 |^*| e23
    XCTAssertEqual(e013_e23.0, -1)
    XCTAssertEqual(e013_e23.1, e3.1)
    
    let e23_e013 = e23 |^*| e013
    XCTAssertEqual(e23_e013.0, -1)
    XCTAssertEqual(e23_e013.1, e3.1)
    
    let e23_e0123 = e23 |^*| e0123
    XCTAssertEqual(e23_e0123.0, 1)
    XCTAssertEqual(e23_e0123.1, e23.1)
    
    let e0123_e23 = e0123 |^*| e23
    XCTAssertEqual(e0123_e23.0, 1)
    XCTAssertEqual(e0123_e23.1, e23.1)
  }
  
  func testRegressivewithE021_E3_E03_E31_E23_E013_E032_E123_E0123() {
    let e021_e3 = e021 |^*| e3
    XCTAssertEqual(e021_e3.0, -1)
    XCTAssertEqual(e021_e3.1, [])
    
    let e3_e021 = e3 |^*| e021
    XCTAssertEqual(e3_e021.0, 1)
    XCTAssertEqual(e3_e021.1, [])
    
    let e021_e03 = e021 |^*| e03
    XCTAssertEqual(e021_e03.0, 1)
    XCTAssertEqual(e021_e03.1, e0.1)
    
    let e03_e021 = e03 |^*| e021
    XCTAssertEqual(e03_e021.0, 1)
    XCTAssertEqual(e03_e021.1, e0.1)
    
    let e021_e23 = e021 |^*| e23
    XCTAssertEqual(e021_e23.0, 1)
    XCTAssertEqual(e021_e23.1, e2.1)
    
    let e23_e021 = e23 |^*| e021
    XCTAssertEqual(e23_e021.0, 1)
    XCTAssertEqual(e23_e021.1, e2.1)
    
    let e013_e021 = e013 |^*| e021
    XCTAssertEqual(e013_e021.0, 1)
    XCTAssertEqual(e013_e021.1, e01.1)
    
    let e021_e032 = e021 |^*| e032
    XCTAssertEqual(e021_e032.0, 1)
    XCTAssertEqual(e021_e032.1, e02.1)
    
    let e032_e021 = e032 |^*| e021
    XCTAssertEqual(e032_e021.0, -1)
    XCTAssertEqual(e032_e021.1, e02.1)
    
    let e021_e123 = e021 |^*| e123
    XCTAssertEqual(e021_e123.0, -1)
    XCTAssertEqual(e021_e123.1, e21.1)
    
    let e123_e021 = e123 |^*| e021
    XCTAssertEqual(e123_e021.0, 1)
    XCTAssertEqual(e123_e021.1, e21.1)
    
    let e021_e0123 = e021 |^*| e0123
    XCTAssertEqual(e021_e0123.0, 1)
    XCTAssertEqual(e021_e0123.1, e021.1)
    
    let e0123_e021 = e0123 |^*| e021
    XCTAssertEqual(e0123_e021.0, 1)
    XCTAssertEqual(e0123_e021.1, e021.1)
  }
  
  func testRegressivewithE013_E2_E02_E12_E23_E021_E032_E123_E0123() {
    let e013_e2 = e013 |^*| e2
    XCTAssertEqual(e013_e2.0, -1)
    XCTAssertEqual(e013_e2.1, [])
    
    let e2_e013 = e2 |^*| e013
    XCTAssertEqual(e2_e013.0, 1)
    XCTAssertEqual(e2_e013.1, [])
    
    let e013_e02 = e013 |^*| e02
    XCTAssertEqual(e013_e02.0, 1)
    XCTAssertEqual(e013_e02.1, e0.1)
    
    let e02_e013 = e02 |^*| e013
    XCTAssertEqual(e02_e013.0, 1)
    XCTAssertEqual(e02_e013.1, e0.1)
    
    let e013_e12 = e013 |^*| e12
    XCTAssertEqual(e013_e12.0, 1)
    XCTAssertEqual(e013_e12.1, e1.1)
    
    let e12_e013 = e12 |^*| e013
    XCTAssertEqual(e12_e013.0, 1)
    XCTAssertEqual(e12_e013.1, e1.1)
    
    let e013_e23 = e013 |^*| e23
    XCTAssertEqual(e013_e23.0, -1)
    XCTAssertEqual(e013_e23.1, e3.1)
    
    let e23_e013 = e23 |^*| e013
    XCTAssertEqual(e23_e013.0, -1)
    XCTAssertEqual(e23_e013.1, e3.1)
    
    let e032_e013 = e032 |^*| e013
    XCTAssertEqual(e032_e013.0, 1)
    XCTAssertEqual(e032_e013.1, e03.1)
    
    let e23_e021 = e23 |^*| e021
    XCTAssertEqual(e23_e021.0, 1)
    XCTAssertEqual(e23_e021.1, e2.1)
    
    let e021_e013 = e021 |^*| e013
    XCTAssertEqual(e021_e013.0, -1)
    XCTAssertEqual(e021_e013.1, e01.1)
    
    let e013_e123 = e013 |^*| e123
    XCTAssertEqual(e013_e123.0, 1)
    XCTAssertEqual(e013_e123.1, e13.1)
    
    let e123_e013 = e123 |^*| e013
    XCTAssertEqual(e123_e013.0, -1)
    XCTAssertEqual(e123_e013.1, e13.1)
    
    let e013_e0123 = e013 |^*| e0123
    XCTAssertEqual(e013_e0123.0, -1)
    XCTAssertEqual(e013_e0123.1, e013.1)
    
    let e0123_e013 = e0123 |^*| e013
    XCTAssertEqual(e0123_e013.0, -1)
    XCTAssertEqual(e0123_e013.1, e013.1)
  }
  
  func testRegressivewithE032_E1_E01_E12_E31_E021_E013_E123_E0123() {
    let e032_e1 = e032 |^*| e1
    XCTAssertEqual(e032_e1.0, -1)
    XCTAssertEqual(e032_e1.1, [])
    
    let e1_e013 = e1 |^*| e032
    XCTAssertEqual(e1_e013.0, 1)
    XCTAssertEqual(e1_e013.1, [])
    
    let e032_e01 = e032 |^*| e01
    XCTAssertEqual(e032_e01.0, 1)
    XCTAssertEqual(e032_e01.1, e0.1)
    
    let e01_e032 = e01 |^*| e032
    XCTAssertEqual(e01_e032.0, 1)
    XCTAssertEqual(e01_e032.1, e0.1)
    
    let e032_e12 = e013 |^*| e12
    XCTAssertEqual(e032_e12.0, 1)
    XCTAssertEqual(e032_e12.1, e1.1)
    
    let e12_e013 = e12 |^*| e013
    XCTAssertEqual(e12_e013.0, 1)
    XCTAssertEqual(e12_e013.1, e1.1)
    
    let e032_e31 = e032 |^*| e31
    XCTAssertEqual(e032_e31.0, 1)
    XCTAssertEqual(e032_e31.1, e3.1)
    
    let e31_e013 = e31 |^*| e032
    XCTAssertEqual(e31_e013.0, 1)
    XCTAssertEqual(e31_e013.1, e3.1)
    
    let e032_e013 = e032 |^*| e013
    XCTAssertEqual(e032_e013.0, 1)
    XCTAssertEqual(e032_e013.1, e03.1)
    
    let e032_e021 = e032 |^*| e021
    XCTAssertEqual(e032_e021.0, -1)
    XCTAssertEqual(e032_e021.1, e02.1)
    
    let e021_e032 = e021 |^*| e032
    XCTAssertEqual(e021_e032.0, 1)
    XCTAssertEqual(e021_e032.1, e02.1)
    
    let e032_e123 = e032 |^*| e123
    XCTAssertEqual(e032_e123.0, -1)
    XCTAssertEqual(e032_e123.1, e23.1)
    
    let e123_e032 = e123 |^*| e032
    XCTAssertEqual(e123_e032.0, 1)
    XCTAssertEqual(e123_e032.1, e23.1)
    
    let e032_e0123 = e013 |^*| e0123
    XCTAssertEqual(e032_e0123.0, -1)
    XCTAssertEqual(e032_e0123.1, e013.1)
    
    let e0123_e013 = e0123 |^*| e013
    XCTAssertEqual(e0123_e013.0, -1)
    XCTAssertEqual(e0123_e013.1, e013.1)
  }
  
  func testRegressivewithE123_E0_E01_E02_E03_E021_E013_E032_E123_E0123() {
    let e123_e0 = e123 |^*| e0
    XCTAssertEqual(e123_e0.0, -1)
    XCTAssertEqual(e123_e0.1, [])
    
    let e0_e013 = e0 |^*| e123
    XCTAssertEqual(e0_e013.0, 1)
    XCTAssertEqual(e0_e013.1, [])
    
    let e123_e01 = e123 |^*| e01
    XCTAssertEqual(e123_e01.0, -1)
    XCTAssertEqual(e123_e01.1, e1.1)
    
    let e01_e123 = e01 |^*| e123
    XCTAssertEqual(e01_e123.0, -1)
    XCTAssertEqual(e01_e123.1, e1.1)
    
    let e123_e02 = e013 |^*| e02
    XCTAssertEqual(e123_e02.0, 1)
    XCTAssertEqual(e123_e02.1, e0.1)
    
    let e02_e013 = e02 |^*| e013
    XCTAssertEqual(e02_e013.0, 1)
    XCTAssertEqual(e02_e013.1, e0.1)
    
    let e123_e03 = e123 |^*| e03
    XCTAssertEqual(e123_e03.0, -1)
    XCTAssertEqual(e123_e03.1, e3.1)
    
    let e03_e123 = e03 |^*| e123
    XCTAssertEqual(e03_e123.0, -1)
    XCTAssertEqual(e03_e123.1, e3.1)
    
    let e123_e013 = e123 |^*| e013
    XCTAssertEqual(e123_e013.0, -1)
    XCTAssertEqual(e123_e013.1, e13.1)
    
    let e013_e123 = e013 |^*| e123
    XCTAssertEqual(e013_e123.0, 1)
    XCTAssertEqual(e013_e123.1, e13.1)
    
    let e123_e021 = e123 |^*| e021
    XCTAssertEqual(e123_e021.0, 1)
    XCTAssertEqual(e123_e021.1, e12.1)
    
    let e021_e123 = e021 |^*| e123
    XCTAssertEqual(e021_e123.0, -1)
    XCTAssertEqual(e021_e123.1, e12.1)
    
    let e123_e032 = e123 |^*| e032
    XCTAssertEqual(e123_e032.0, 1)
    XCTAssertEqual(e123_e032.1, e23.1)
    
    let e032_e123 = e032 |^*| e123
    XCTAssertEqual(e032_e123.0, -1)
    XCTAssertEqual(e032_e123.1, e23.1)
    
    let e123_e123 = e123 |^*| e123
    XCTAssertEqual(e123_e123.0, 0)
    XCTAssertEqual(e123_e123.1, [])
    
    let e123_e0123 = e013 |^*| e0123
    XCTAssertEqual(e123_e0123.0, -1)
    XCTAssertEqual(e123_e0123.1, e013.1)
    
    let e0123_e013 = e0123 |^*| e013
    XCTAssertEqual(e0123_e013.0, -1)
    XCTAssertEqual(e0123_e013.1, e013.1)
  }
}

