import XCTest

final class bivectorTests: XCTestCase  {
  
  func testScalarProducts() {
    let a:Float = 5
    let dot_a = a ||| a
    let wedge_a = a |^| a
    let gp_a = a |*| a
    XCTAssertEqual(dot_a, a*a)
    XCTAssertEqual(gp_a, a*a)
    XCTAssertEqual(wedge_a, a*a)
    
    let b:Float = 7
    XCTAssertEqual(a ||| b, a*b)
    XCTAssertEqual(a |*| b, a*b)
    XCTAssertEqual(a |^| b, a*b)
  }
  
  func testArrayOfScalarProducts() {
    let a:[Float] = [5]
    XCTAssertEqual(a ||| a, (a+a).reduce(1, *))
    XCTAssertEqual(a |*| a, (a+a).reduce(1, *))
    XCTAssertEqual(a |^| a, (a+a).reduce(1, *))
    
    let b:[Float] = [7]
    XCTAssertEqual(a ||| b, (a+b).reduce(1, *))
    XCTAssertEqual(a |^| b, (a+b).reduce(1, *))
    XCTAssertEqual(a |*| b, (a+b).reduce(1, *))
    
    let c:[Float] = [1,2,3,4]
    let d:[Float] = [5,6,7,8,9]
    XCTAssertEqual(d |*| c, (c+d).reduce(1, *))
    XCTAssertEqual(d |^| c, (c+d).reduce(1, *))
  }
}
