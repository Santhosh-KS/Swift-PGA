import XCTest

final class additionOperationTests: XCTestCase {
  func testScalarAddition() {
    let a:Float = 10
    let b:Float = 15
    XCTAssertEqual(a |+| b, a+b)
  }
  
  func testScalarAddGrade1() {
    let e01 = 10 |+| e(1)
    XCTAssertEqual(e01.first!.0, 10)
    XCTAssertEqual(e01.first!.1.first, nil)
    
    XCTAssertEqual(e01.last!.0, 1)
    XCTAssertEqual(e01.last!.1.first!, e(1))
    
    let e02 = e(2) |+| 123
    XCTAssertEqual(e02.first!.0, 123)
    XCTAssertEqual(e02.first!.1.first, nil)
    
    XCTAssertEqual(e02.last!.0, 1)
    XCTAssertEqual(e02.last!.1.first!, e(2))
  }
  
  func testGrade1AddGrade1() {
    let e00:[(Double, e)] = e(0) |+| e(0)
    XCTAssertEqual(e00.first!.0, 2)
    XCTAssertEqual(e00.first!.1, e(0))
    
    let e11:[(Double, e)] = e(1) |+| e(1)
    XCTAssertEqual(e11.first!.0, 2)
    XCTAssertEqual(e11.first!.1, e(1))
    
    let e02:[(Double, e)] = e(2) |+| e(2)
    XCTAssertEqual(e02.first!.0, 2)
    XCTAssertEqual(e02.first!.1, e(2))
    
    XCTAssertEqual(e02.last!.0, 2)
    XCTAssertEqual(e02.last!.1, e(2))
    
    let e03:[(Double, e)] = e(3) |+| e(3)
    XCTAssertEqual(e03.first!.0, 2)
    XCTAssertEqual(e03.first!.1, e(3))
    
    let e01:[(Double, e)] = e(0) |+| e(1)
    XCTAssertEqual(e01.first!.0, 1)
    XCTAssertEqual(e01.first!.1, e(0))
    
    let e12:[(Double, e)] = e(1) |+| e(2)
    XCTAssertEqual(e12.first!.0, 1)
    XCTAssertEqual(e12.first!.1, e(1))
    
      // Commutativity wrt addition.
    let e21:[(Double, e)] = e(2) |+| e(1)
    XCTAssertEqual(e12.first!.0, e21.last!.0)
    XCTAssertEqual(e12.last!.0,  e21.first!.0)
  }
  
  func testGrade2AddGrade1() {
    let add_e0_e0:[(Double, [e])] = [e(0)] |+| e(0)
    XCTAssertEqual(add_e0_e0.first!.0, 2)
    XCTAssertEqual(add_e0_e0.first!.1.count, 1)
    XCTAssertEqual(add_e0_e0.first!.1.first!, e(0))
    
    let add_e0_e0_rev:[(Double, [e])] = e(0) |+| [e(0)]
    XCTAssertEqual(add_e0_e0_rev.first!.0, 2)
    XCTAssertEqual(add_e0_e0_rev.first!.1.count, 1)
    XCTAssertEqual(add_e0_e0_rev.first!.1.first!, e(0))
    
    let add_1e0_2e0:[(Double, [e])] = (1, [e(0)]) |+| (2, e(0))
    XCTAssertEqual(add_1e0_2e0.first!.0, 1+2)
    XCTAssertEqual(add_1e0_2e0.first!.1.first!, e(0))
    
    let add_1e0_2e0_rev:[(Double, [e])] = (2, e(0)) |+| (1, [e(0)])
    XCTAssertEqual(add_1e0_2e0_rev.first!.0, 1+2)
    XCTAssertEqual(add_1e0_2e0_rev.first!.1.first!, e(0))
    
    let add_e1_e1:[(Double, [e])] = [e(1)] |+| e(1)
    XCTAssertEqual(add_e1_e1.first!.0, 2)
    XCTAssertEqual(add_e1_e1.first!.1.count, 1)
    XCTAssertEqual(add_e1_e1.first!.1.first!, e(1))
    
    let add_e1_e1_rev:[(Double, [e])] = e(1) |+| [e(1)]
    XCTAssertEqual(add_e1_e1_rev.first!.0, 2)
    XCTAssertEqual(add_e1_e1_rev.first!.1.count, 1)
    XCTAssertEqual(add_e1_e1_rev.first!.1.first!, e(1))
    
    let add_2e1_5e1:[(Double, [e])] = (2, [e(1)]) |+| (5, e(1))
    XCTAssertEqual(add_2e1_5e1.first!.0, 2+5)
    XCTAssertEqual(add_2e1_5e1.first!.1.count, 1)
    XCTAssertEqual(add_2e1_5e1.first!.1.first!, e(1))
    
    let add_2e1_5e1_rev:[(Double, [e])] = (5, e(1)) |+| (2, [e(1)])
    XCTAssertEqual(add_2e1_5e1_rev.first!.0, 2+5)
    XCTAssertEqual(add_2e1_5e1_rev.first!.1.count, 1)
    XCTAssertEqual(add_2e1_5e1_rev.first!.1.first!, e(1))
    
    let add_e2_e2:[(Double, [e])] = [e(2)] |+| e(2)
    XCTAssertEqual(add_e2_e2.first!.0, 2)
    XCTAssertEqual(add_e2_e2.first!.1.count, 1)
    XCTAssertEqual(add_e2_e2.first!.1.first!, e(2))
    
    let add_e2_e2_rev:[(Double, [e])] = e(2) |+| [e(2)]
    XCTAssertEqual(add_e2_e2_rev.first!.0, 2)
    XCTAssertEqual(add_e2_e2_rev.first!.1.count, 1)
    XCTAssertEqual(add_e2_e2_rev.first!.1.first!, e(2))
    
    let add_7e2_4e2:[(Double, [e])] = (7, [e(2)]) |+| (4, e(2))
    XCTAssertEqual(add_7e2_4e2.first!.0, 7+4)
    XCTAssertEqual(add_7e2_4e2.first!.1.count, 1)
    XCTAssertEqual(add_7e2_4e2.first!.1.first!, e(2))
    
    let add_7e2_4e2_rev:[(Double, [e])] = (4, e(2)) |+| (7, [e(2)])
    XCTAssertEqual(add_7e2_4e2_rev.first!.0, 7+4)
    XCTAssertEqual(add_7e2_4e2_rev.first!.1.count, 1)
    XCTAssertEqual(add_7e2_4e2_rev.first!.1.first!, e(2))
    
    let add_e3_e3:[(Double, [e])] = [e(3)] |+| e(3)
    XCTAssertEqual(add_e3_e3.first!.0, 2)
    XCTAssertEqual(add_e3_e3.first!.1.count, 1)
    XCTAssertEqual(add_e3_e3.first!.1.first!, e(3))
    
    let add_e3_e3_rev:[(Double, [e])] = e(3) |+| [e(3)]
    XCTAssertEqual(add_e3_e3_rev.first!.0, 2)
    XCTAssertEqual(add_e3_e3_rev.first!.1.count, 1)
    XCTAssertEqual(add_e3_e3_rev.first!.1.first!, e(3))
    
    let add_4e3_7e3:[(Double, [e])] = (4, e(3)) |+| (7, [e(3)])
    XCTAssertEqual(add_4e3_7e3.first!.0, 4+7)
    XCTAssertEqual(add_4e3_7e3.first!.1.count, 1)
    XCTAssertEqual(add_4e3_7e3.first!.1.first!, e(3))
    
    let add_4e3_7e3_rev:[(Double, [e])] = (7, [e(3)]) |+| (4, e(3))
    XCTAssertEqual(add_4e3_7e3_rev.first!.0, 4+7)
    XCTAssertEqual(add_4e3_7e3_rev.first!.1.count, 1)
    XCTAssertEqual(add_4e3_7e3_rev.first!.1.first!, e(3))
    
    let add_e0_e1:[(Double, [e])] = e(0) |+| [e(1)]
    XCTAssertEqual(add_e0_e1.count, 2)
    XCTAssertEqual(add_e0_e1.first!.0, 1)
    XCTAssertEqual(add_e0_e1.first!.1.first!, e(0))
    
    let add_e0_e1_rev:[(Double, [e])] = [e(1)] |+| e(0)
    XCTAssertEqual(add_e0_e1_rev.count, 2)
    XCTAssertEqual(add_e0_e1_rev.first!.0, 1)
    XCTAssertEqual(add_e0_e1_rev.first!.1.first!, e(1))
    XCTAssertEqual(add_e0_e1_rev.last!.1.first!, e(0))
    
    let add_4e0_6e1:[(Double, [e])] = (4, e(0)) |+| (6, [e(1)])
    XCTAssertEqual(add_4e0_6e1.count, 2)
    XCTAssertEqual(add_4e0_6e1.first!.0, 4)
    XCTAssertEqual(add_4e0_6e1.first!.1.first!, e(0))
    XCTAssertEqual(add_4e0_6e1.last!.0, 6)
    XCTAssertEqual(add_4e0_6e1.last!.1.first!, e(1))
    
    let add_4e0_6e1_rev:[(Double, [e])] = (6, [e(1)]) |+| (4, e(0))
    XCTAssertEqual(add_4e0_6e1_rev.count, 2)
    XCTAssertEqual(add_4e0_6e1_rev.first!.0, 6)
    XCTAssertEqual(add_4e0_6e1_rev.first!.1.first!, e(1))
    XCTAssertEqual(add_4e0_6e1_rev.last!.0, 4)
    XCTAssertEqual(add_4e0_6e1_rev.last!.1.first!, e(0))
    
    let add_e1_e2:[(Double, [e])] = e(1) |+| [e(2)]
    XCTAssertEqual(add_e1_e2.count, 2)
    XCTAssertEqual(add_e1_e2.first!.0, 1)
    XCTAssertEqual(add_e1_e2.first!.1.first!, e(1))
    XCTAssertEqual(add_e1_e2.last!.0, 1)
    XCTAssertEqual(add_e1_e2.last!.1.first!, e(2))
    
    let add_e1_e2_rev:[(Double, [e])] = [e(2)] |+| e(1)
    XCTAssertEqual(add_e1_e2_rev.count, 2)
    XCTAssertEqual(add_e1_e2_rev.first!.0, 1)
    XCTAssertEqual(add_e1_e2_rev.first!.1.first!, e(2))
    XCTAssertEqual(add_e1_e2_rev.last!.0, 1)
    XCTAssertEqual(add_e1_e2_rev.last!.1.first!, e(1))
    
    let add_1e1_2e2:[(Double, [e])] = (1, e(1)) |+| (2, [e(2)])
    XCTAssertEqual(add_1e1_2e2.count, 2)
    XCTAssertEqual(add_1e1_2e2.first!.0, 1)
    XCTAssertEqual(add_1e1_2e2.first!.1.first!, e(1))
    XCTAssertEqual(add_1e1_2e2.last!.0, 2)
    XCTAssertEqual(add_1e1_2e2.last!.1.first!, e(2))
    
    let add_1e1_2e2_rev:[(Double, [e])] = (2, [e(2)]) |+| (1, e(1))
    XCTAssertEqual(add_1e1_2e2_rev.count, 2)
    XCTAssertEqual(add_1e1_2e2_rev.first!.0, 2)
    XCTAssertEqual(add_1e1_2e2_rev.first!.1.first!, e(2))
    XCTAssertEqual(add_1e1_2e2_rev.last!.0, 1)
    XCTAssertEqual(add_1e1_2e2_rev.last!.1.first!, e(1))
    
      // Commutativity wrt addition.
    let add_e2_e1:[(Double, [e])] = e(2) |+| [e(1)]
    XCTAssertEqual(add_e2_e1.count, 2)
    XCTAssertEqual(add_e2_e1.first!.0, add_e1_e2.last!.0)
    XCTAssertEqual(add_e2_e1.last!.1,  add_e1_e2.first!.1)
    
    let add_e2_e1_rev:[(Double, [e])] = [e(1)] |+| e(2)
    XCTAssertEqual(add_e2_e1_rev.count, 2)
    XCTAssertEqual(add_e2_e1_rev.first!.0, add_e1_e2_rev.last!.0)
    XCTAssertEqual(add_e2_e1_rev.last!.1,  add_e1_e2_rev.first!.1)
    
    let add_2e2_1e1:[(Double, [e])] = (2, e(2)) |+| (1, [e(1)])
    XCTAssertEqual(add_2e2_1e1.count, 2)
    XCTAssertEqual(add_2e2_1e1.first!.0, add_1e1_2e2.last!.0)
    XCTAssertEqual(add_2e2_1e1.last!.1,  add_1e1_2e2.first!.1)
    
    let add_2e2_1e1_rev:[(Double, [e])] = (1, [e(1)]) |+| (2, e(2))
    XCTAssertEqual(add_2e2_1e1_rev.count, 2)
    XCTAssertEqual(add_2e2_1e1_rev.first!.0, add_1e1_2e2_rev.last!.0)
    XCTAssertEqual(add_2e2_1e1_rev.last!.1,  add_1e1_2e2_rev.first!.1)
    
    let add_1e01_2e1:[(Double, [e])] = (1, [e(0), e(1)]) |+| (2, e(1))
    XCTAssertEqual(add_1e01_2e1.count, 2)
    XCTAssertEqual(add_1e01_2e1.first!.1.count, 1)
    XCTAssertEqual(add_1e01_2e1.last!.1.count, 2)
    XCTAssertEqual(add_1e01_2e1.first!.0, 2)
    XCTAssertEqual(add_1e01_2e1.first!.1, [e(1)])
    XCTAssertEqual(add_1e01_2e1.last!.0, 1)
    XCTAssertEqual(add_1e01_2e1.last!.1, [e(0), e(1)])
    
    let add_1e01_2e1_rev:[(Double, [e])] = (2, e(1)) |+| (1, [e(0), e(1)])
    XCTAssertEqual(add_1e01_2e1_rev.count, 2)
    XCTAssertEqual(add_1e01_2e1_rev.first!.1.count, 1)
    XCTAssertEqual(add_1e01_2e1_rev.last!.1.count, 2)
    XCTAssertEqual(add_1e01_2e1_rev.first!.0, 2)
    XCTAssertEqual(add_1e01_2e1_rev.first!.1, [e(1)])
    XCTAssertEqual(add_1e01_2e1_rev.last!.0, 1)
    XCTAssertEqual(add_1e01_2e1_rev.last!.1, [e(0), e(1)])
  }
  
}
