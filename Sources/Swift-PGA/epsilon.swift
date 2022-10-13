import Foundation

public struct e {
  var index:UInt8
}

public extension e {
  init(_ x:UInt8) {
    index = x
  }
}

extension e:Equatable, Comparable {
  public static func < (lhs: e, rhs: e) -> Bool {
    lhs.index < rhs.index
  }
}

extension e:CustomStringConvertible {
  public var description: String {
    "e(\(self.index))"
  }
}

extension e:Hashable { }

public func sign<A:FloatingPoint>(_ lhs:e, _ rhs:e) -> A {
  if lhs > rhs { return A.zero - 1}
  return A.zero + 1
}

public func sign<A:FloatingPoint>(_ xs:[e]) -> A  {
  let sorted = xs.sorted()
  if xs == sorted { return A.zero + 1 }
    // TODO: Use different approach than bubblesort
  return bubbleSort(xs).0
  
}

func bubbleSort<A:FloatingPoint> (_ xs: [e]) -> (A, [e]) {
  guard xs.count > 1 else { return (1, xs)}
  var sortedArray = xs
  var retVal:A = A.zero + 1
  for i in 0..<sortedArray.count {
    for j in 0..<sortedArray.count-i-1 {
      if sortedArray[j]>sortedArray[j + 1] {
        sortedArray.swapAt(j + 1, j)
        retVal *= -1
      }
    }
  }
  return (retVal, sortedArray)
}

public func process<A:FloatingPoint> (_ lhs:e, _ rhs:e) -> (A, [e]) {
  ((lhs |> unitVector), (rhs |> unitVector)) |>  process 
}

public func process<A:FloatingPoint> (_ lhs:(A,e), _ rhs:(A,e)) -> (A, [e]) {
  isEqualBasis(lhs.1, rhs.1) ? (lhs.0 * rhs.0, []) : (lhs.0 * rhs.0, [lhs.1, rhs.1])
}

public func isEqualBasis(_ lhs:e, _ rhs:e) -> Bool {
  lhs == rhs
}

public func isNullBasis(_ b:e) -> Bool {
  b == e(0)
}

public func normalized<A:FloatingPoint> (_ exp:(A, [e])) -> (A, [e]) {
  let sign:(A, [e]) = bubbleSort(exp.1)
  return (exp.0 * sign.0, sign.1)
}

public func normalized<A:FloatingPoint> (_ exp:(A, e)) -> (A, [e]) {
  exp |> arrayfySecond
}

public func removeDuplicates(_ xs:[e]) -> [e] {
  var retVal = [e]()
  var savedIndex = 0
  zip((0...), xs).forEach { (index, x) in
    if !contains(retVal, x) {
      retVal.append(x)
      savedIndex += 1
    } else {
      retVal.remove(at: savedIndex-1)
      savedIndex -= 1
    }
  }
  return retVal
}

public func contains(_ xs:[e], _ val:e) -> Bool {
  if xs.contains(where: { le in val == le }) {
    return true
  }
  return false
}

public func grade<A:FloatingPoint>(_ exp:(A,[e])) -> UInt8 {
  exp.1.isEmpty ? 0 : (exp.1 == [e(0)] ?  0 : UInt8(exp.1.count))
}

public func grade<A:FloatingPoint>(_ exp:A) -> UInt8 {
  0
}

public func grade<A:FloatingPoint>(with val:UInt8, in exp:[(A,[e])]) -> [(A,[e])] {
  var retVal = [(A,[e])]()
  for xp in exp {
    let grd = grade(xp)
    if grd == val {
      retVal.append(xp)
    }
  }
  return retVal
}

enum domain:String {
  case VGA = "VectorSpace Geometric Algebra"
  case STA = "Space Time Algebra"
  case PGA = "Projective Geometric Algebra"
  case CGA = "Conformal Geometric Algebra"
}

let e0 = 1.0 |*| e(0)
let e1 = 1.0 |*| e(1)
let e2 = 1.0 |*| e(2)
let e3 = 1.0 |*| e(3)
let e00 = e0 |*| e0
let e01 = e0 |*| e1
let e02 = e0 |*| e2
let e03 = e0 |*| e3
let e10 = e1 |*| e0
let e11 = e1 |*| e1
let e12 = e1 |*| e2
let e13 = e1 |*| e3
let e20 = e2 |*| e0
let e21 = e2 |*| e1
let e22 = e2 |*| e2
let e23 = e2 |*| e3
let e30 = e3 |*| e0
let e31 = e3 |*| e1
let e32 = e3 |*| e2
let e33 = e3 |*| e3

//let e000 = (e00 |*| e0).first!
//let e001 = (e00 |*| e1).first!
//let e002 = (e00 |*| e2).first!
//let e003 = (e00 |*| e3).first!
//let e010 = (e01 |*| e0).first!
let e011 = e01 |*| e1
let e012 = e01 |*| e2
let e013 = e01 |*| e3
//let e020 = (e02 |*| e0).first!
let e021 = e02 |*| e1
let e022 = e02 |*| e2
let e023 = e02 |*| e3
//let e030 = (e03 |*| e0).first!
let e031 = e03 |*| e1
let e032 = e03 |*| e2
let e033 = e03 |*| e3
//let e100 = (e10 |*| e0).first!
let e101 = e10 |*| e1
let e102 = e10 |*| e2
let e103 = e10 |*| e3
//let e200 = (e20 |*| e0).first!
let e201 = e20 |*| e1
let e202 = e20 |*| e2
let e203 = e20 |*| e3
//let e300 = (e30 |*| e0).first!
let e301 = e30 |*| e1
let e302 = e30 |*| e2
let e303 = e30 |*| e3
//let e110 = (e10 |*| e0).first!
let e111 = e11 |*| e1
let e112 = e11 |*| e2
let e113 = e11 |*| e3
//let e210 = (e21 |*| e0).first!
let e211 = e21 |*| e1
let e212 = e21 |*| e2
let e213 = e21 |*| e3
//let e310 = (e31 |*| e0).first!
let e311 = e31 |*| e1
let e312 = e31 |*| e2
let e313 = e31 |*| e3
//let e120 = (e12 |*| e0).first!
let e121 = e12 |*| e1
let e122 = e12 |*| e2
let e123 = e12 |*| e3
//let e220 = (e22 |*| e0).first!
let e221 = e22 |*| e1
let e222 = e22 |*| e2
let e223 = e22 |*| e3
//let e320 = (e32 |*| e0).first!
let e321 = e32 |*| e1
let e322 = e32 |*| e2
let e323 = e32 |*| e3
//let e130 = (e13 |*| e0).first!
let e131 = e13 |*| e1
let e132 = e13 |*| e2
let e133 = e13 |*| e3
//let e230 = (e23 |*| e0).first!
let e231 = e23 |*| e1
let e232 = e23 |*| e2
let e233 = e23 |*| e3
//let e330 = (e33 |*| e0).first!
let e331 = e33 |*| e1
let e332 = e33 |*| e2
let e333 = e33 |*| e3
let e0123 = e01 |*| e23

