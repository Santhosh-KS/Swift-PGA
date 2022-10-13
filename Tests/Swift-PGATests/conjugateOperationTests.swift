import XCTest
/*
final class conjugateOperationTests: XCTestCase  {
  
  func testGrade2AddGrade2() {
    let add_e0_e0:[(Double, [e])] = [e(0)] |+| [e(0)]
    XCTAssertEqual(add_e0_e0.first!.0, 2)
    XCTAssertEqual(add_e0_e0.first!.1.count, 1)
    XCTAssertEqual(add_e0_e0.first!.1.first!, e(0))
    
    let add_1e0_2e0:[(Double, [e])] = (1, [e(0)]) |+| (2, [e(0)])
    XCTAssertEqual(add_1e0_2e0.first!.0, 1+2)
    XCTAssertEqual(add_1e0_2e0.first!.1.first!, e(0))
    
    let add_e1_e1:[(Double, [e])] = [e(1)] |+| [e(1)]
    XCTAssertEqual(add_e1_e1.first!.0, 2)
    XCTAssertEqual(add_e1_e1.first!.1.count, 1)
    XCTAssertEqual(add_e1_e1.first!.1.first!, e(1))
    
    let add_2e1_5e1:[(Double, [e])] = (2, [e(1)]) |+| (5, [e(1)])
    XCTAssertEqual(add_2e1_5e1.first!.0, 2+5)
    XCTAssertEqual(add_2e1_5e1.first!.1.count, 1)
    XCTAssertEqual(add_2e1_5e1.first!.1.first!, e(1))
    
    let add_e2_e2:[(Double, [e])] = [e(2)] |+| [e(2)]
    XCTAssertEqual(add_e2_e2.first!.0, 2)
    XCTAssertEqual(add_e2_e2.first!.1.count, 1)
    XCTAssertEqual(add_e2_e2.first!.1.first!, e(2))
    
    let add_7e2_4e2:[(Double, [e])] = (7, [e(2)]) |+| (4, [e(2)])
    XCTAssertEqual(add_7e2_4e2.first!.0, 7+4)
    XCTAssertEqual(add_7e2_4e2.first!.1.count, 1)
    XCTAssertEqual(add_7e2_4e2.first!.1.first!, e(2))
    
    let add_e3_e3:[(Double, [e])] = [e(3)] |+| [e(3)]
    XCTAssertEqual(add_e3_e3.first!.0, 2)
    XCTAssertEqual(add_e3_e3.first!.1.count, 1)
    XCTAssertEqual(add_e3_e3.first!.1.first!, e(3))
    
    let add_4e3_7e3:[(Double, [e])] = (4, [e(3)]) |+| (7, [e(3)])
    XCTAssertEqual(add_4e3_7e3.first!.0, 4+7)
    XCTAssertEqual(add_4e3_7e3.first!.1.count, 1)
    XCTAssertEqual(add_4e3_7e3.first!.1.first!, e(3))
    
    let add_e0_e1:[(Double, [e])] = [e(0)] |+| [e(1)]
    XCTAssertEqual(add_e0_e1.count, 2)
    XCTAssertEqual(add_e0_e1.first!.0, 1)
    XCTAssertEqual(add_e0_e1.first!.1.first!, e(0))
    
    let add_4e0_6e1:[(Double, [e])] = (4, [e(0)]) |+| (6, [e(1)])
    XCTAssertEqual(add_4e0_6e1.count, 2)
    XCTAssertEqual(add_4e0_6e1.first!.0, 4)
    XCTAssertEqual(add_4e0_6e1.first!.1.first!, e(0))
    XCTAssertEqual(add_4e0_6e1.last!.0, 6)
    XCTAssertEqual(add_4e0_6e1.last!.1.first!, e(1))
    
    let add_e1_e2:[(Double, [e])] = [e(1)] |+| [e(2)]
    XCTAssertEqual(add_e1_e2.count, 2)
    XCTAssertEqual(add_e1_e2.first!.0, 1)
    XCTAssertEqual(add_e1_e2.first!.1.first!, e(1))
    XCTAssertEqual(add_e1_e2.last!.0, 1)
    XCTAssertEqual(add_e1_e2.last!.1.first!, e(2))
    
    let add_1e1_2e2:[(Double, [e])] = (1, [e(1)]) |+| (2, [e(2)])
    XCTAssertEqual(add_1e1_2e2.count, 2)
    XCTAssertEqual(add_1e1_2e2.first!.0, 1)
    XCTAssertEqual(add_1e1_2e2.first!.1.first!, e(1))
    XCTAssertEqual(add_1e1_2e2.last!.0, 2)
    XCTAssertEqual(add_1e1_2e2.last!.1.first!, e(2))
    
      // Commutativity wrt addition.
    let add_e2_e1:[(Double, [e])] = [e(2)] |+| [e(1)]
    XCTAssertEqual(add_e2_e1.count, 2)
    XCTAssertEqual(add_e2_e1.first!.0, add_e1_e2.last!.0)
    XCTAssertEqual(add_e2_e1.last!.1,  add_e1_e2.first!.1)
    
    let add_2e2_1e1:[(Double, [e])] = (2, [e(2)]) |+| (1, [e(1)])
    XCTAssertEqual(add_2e2_1e1.count, 2)
    XCTAssertEqual(add_2e2_1e1.first!.0, add_1e1_2e2.last!.0)
    XCTAssertEqual(add_2e2_1e1.last!.1,  add_1e1_2e2.first!.1)
    
    let add_1e01_2e1:[(Double, [e])] = (1, [e(0), e(1)]) |+| (2, [e(1)])
    XCTAssertEqual(add_1e01_2e1.count, 2)
    XCTAssertEqual(add_1e01_2e1.first!.1.count, 1)
    XCTAssertEqual(add_1e01_2e1.last!.1.count, 2)
    XCTAssertEqual(add_1e01_2e1.first!.0, 2)
    XCTAssertEqual(add_1e01_2e1.first!.1, [e(1)])
    XCTAssertEqual(add_1e01_2e1.last!.0, 1)
    XCTAssertEqual(add_1e01_2e1.last!.1, [e(0), e(1)])
    
    let add_1e01_2e01:[(Double, [e])] = (1, [e(0), e(1)]) |+| (2, [e(0), e(1)])
    XCTAssertEqual(add_1e01_2e01.count, 1)
    XCTAssertEqual(add_1e01_2e01.first!.1.count, 2)
    XCTAssertEqual(add_1e01_2e01.first!.0, 3)
    XCTAssertEqual(add_1e01_2e01.first!.1, [e(0), e(1)])
    
    let add_1e01_2e10:[(Double, [e])] = (1, [e(0), e(1)]) |+| (2, [e(1), e(0)])
    XCTAssertEqual(add_1e01_2e10.count, 1)
    XCTAssertEqual(add_1e01_2e10.first!.1.count, 2)
    XCTAssertEqual(add_1e01_2e10.first!.0, -1)
    XCTAssertEqual(add_1e01_2e10.first!.1, [e(0), e(1)])
    
    let add_1e01_2e23:[(Double, [e])] = (1, [e(0), e(1)]) |+| (2, [e(2), e(3)])
    XCTAssertEqual(add_1e01_2e23.count, 2)
    XCTAssertEqual(add_1e01_2e23.first!.1.count, 2)
    XCTAssertEqual(add_1e01_2e23.last!.1.count, 2)
    XCTAssertEqual(add_1e01_2e23.first!.0, 1)
    XCTAssertEqual(add_1e01_2e23.first!.1, [e(0), e(1)])
    XCTAssertEqual(add_1e01_2e23.last!.0, 2)
    XCTAssertEqual(add_1e01_2e23.last!.1, [e(2), e(3)])
    
    let add_2e23_1e01:[(Double, [e])] = (2, [e(2), e(3)]) |+| (1, [e(0), e(1)])
    XCTAssertEqual(add_2e23_1e01.count, 2)
    XCTAssertEqual(add_2e23_1e01.first!.1.count, 2)
    XCTAssertEqual(add_2e23_1e01.last!.1.count, 2)
    XCTAssertEqual(add_2e23_1e01.first!.0, 2)
    XCTAssertEqual(add_2e23_1e01.first!.1, [e(2), e(3)] )
    XCTAssertEqual(add_2e23_1e01.last!.0, 1)
    XCTAssertEqual(add_2e23_1e01.last!.1, [e(0), e(1)])
    
  }
  
  func testConjugateOfGrade0() {
    XCTAssertEqual(conjugate(e0).0, 1)
    let c_10:Double = conjugate(10.0)
    XCTAssertEqual(c_10, 10)
    XCTAssertEqual(conjugate(e11).0, 1)
    XCTAssertEqual(conjugate(e22).0, 1)
    XCTAssertEqual(conjugate(e33).0, 1)
    XCTAssertEqual(conjugate(e11).1, [])
    XCTAssertEqual(conjugate(e22).1, [])
    XCTAssertEqual(conjugate(e33).1, [])
    
    XCTAssertEqual(conjugate((10 |*| e11)).0, 10)
    XCTAssertEqual(conjugate((1.1 |*| e22)).0, 1.1)
    XCTAssertEqual(conjugate((3.14 |*| e33)).0, 3.14)
  }
    // TODO: Fix Conjugate issues
  /*
   func testConjugateOfMultigrade() {
   let A = (1 |*| e0) |+| (2|*|e1) |+| (3|*|e12) |+| (4 |*| e123)
   let A_conj = conjugate(A)
   let expectedResult:[(Double, [e])] = [(1,[]),
   (-2,[e(1)]),
   (-3,[e(1), e(2)]),
   (-4,[e(1),e(2),e(3)])]
   
   for (a_conj, e_res) in zip2(A_conj, expectedResult) {
   XCTAssertEqual(a_conj.0, e_res.0)
   XCTAssertEqual(a_conj.1, e_res.1)
   }
   
   let A_gp_A_conj = A |*| A_conj
   let A_gp_A_conj_expected_result = [(22.0, []),
   (24.0, [e(3)]),
   (-16.0, [e(2), e(3)])]
   for (a_gp_a_conj, e_res) in zip2(A_gp_A_conj, A_gp_A_conj_expected_result) {
   XCTAssertEqual(a_gp_a_conj.0, e_res.0)
   XCTAssertEqual(a_gp_a_conj.1, e_res.1)
   }
   }
   */
}
*/
