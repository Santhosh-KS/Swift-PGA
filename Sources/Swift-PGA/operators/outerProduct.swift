import Foundation

infix operator |^|:GeometricProductProcessingOrder

public func |^|<A:FloatingPoint> (_ lhs:A, _ rhs:A) -> A {
  lhs * rhs
}

public func |^|<A:FloatingPoint> (_ lhs:[A], _ rhs:[A]) -> A {
  lhs.reduce(1, *) |^| rhs.reduce(1, *)
}

public func |^|<A:FloatingPoint> (_ lhs:A, _ rhs:e) -> (A, e) {
  (lhs, rhs)
}

public func |^|<A:FloatingPoint> (_ lhs:e, _ rhs:A) -> (A, e) {
  rhs |^| lhs
}

public func |^|<A:FloatingPoint> (_ lhs:[A], _ rhs:e) -> (A, e) {
  (lhs.reduce(1, |^|), rhs)
}

public func |^|<A:FloatingPoint> (_ lhs:e, _ rhs:[A]) -> (A, e) {
  rhs |^| lhs
}

public func |^|<A:FloatingPoint> (_ lhs:(A,e), _ rhs:(A, e)) -> (A, [e]) {
  (lhs, rhs) |> (process >>> normalized)
}

public func |^|<A:FloatingPoint> (_ lhs:e, _ rhs:e) -> (A, [e]) {
  (lhs |> unitVector) |^| (rhs |> unitVector)
}

public func isCoefficientZero<A:Numeric>(_ coeff:A ) -> Bool {
  coeff == A.zero
}

public func isCoefficientZero<A:Numeric>(_ vec:(A, [e]) ) -> Bool {
  vec.0 |> isCoefficientZero
}

public func isCoefficientZero<A:Numeric>(_ vec:(A, e) ) -> Bool {
  vec.0 |> isCoefficientZero
}

public func |^|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs:(A, [e])) -> (A, [e]) {
  
  if (lhs.1.sorted() == rhs.1.sorted()) { return zeroVector() }
  else {
    if (lhs |> isCoefficientZero) && (rhs |> isCoefficientZero) { return zeroVector() }
    else if lhs |> isCoefficientZero { return rhs |> normalized }
    else if rhs |> isCoefficientZero { return lhs |> normalized }
    else {
      for re in rhs.1 {
        if (lhs.1, re) |> contains { return zeroVector() }
      }
      return (lhs.0 * rhs.0, lhs.1 + rhs.1) |> normalized
    }
  }
}

func |^|<A:FloatingPoint>(_ lhs:[(A,[e])], _ rhs:[(A,[e])]) -> [(A, [e])] {
  var retVal = [(A, [e])]()
  for lmlv in lhs {
    for rmlv in rhs {
      retVal.append((lmlv |^| rmlv))
    }
  }
  return retVal |> compactMap
}

public func |^|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs:(A, e)) -> (A, [e]) {
  lhs |^| (rhs |> arrayfySecond)
}

public func |^|<A:FloatingPoint> (_ lhs:(A, e), _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> arrayfySecond) |^| rhs
}

public func |^|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs: e) -> (A, [e]) {
  lhs |^| (rhs |> unitVector >>> arrayfySecond)
}

public func |^|<A:FloatingPoint> (_ lhs:e, _ rhs: (A,[e])) -> (A, [e]) {
  (lhs |> unitVector) |^| rhs
}

public func |^|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs: [e]) -> (A, [e]) {
  lhs |^| (rhs |> unitVector)
}

public func |^|<A:FloatingPoint> (_ lhs:[e], _ rhs: (A,[e])) -> (A, [e]) {
  (lhs |> unitVector) |^| rhs
}

public func |^|<A:FloatingPoint> (_ lhs:[e], _ rhs: [e]) -> (A, [e]) {
  (lhs |> unitVector) |^| (rhs |> unitVector)
}
public func |^|<A:FloatingPoint> (_ lhs:A, _ rhs:(A, e)) -> (A,[e]) {
  (lhs*rhs.0, rhs.1) |> arrayfySecond
}

public func |^|<A:FloatingPoint> (_ lhs:(A,e), _ rhs:A) -> (A, [e]) {
  (lhs.0*rhs, lhs.1) |> arrayfySecond
}

public func |^|<A:FloatingPoint> (_ lhs:A, _ rhs:(A, [e])) -> (A,[e]) {
  (lhs*rhs.0, rhs.1)
}

public func |^|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs:A) -> (A, [e]) {
  (lhs.0*rhs, lhs.1)
}
