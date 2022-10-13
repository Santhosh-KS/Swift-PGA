
import Foundation

precedencegroup GeometricProductProcessingOrder {
  associativity:left
  higherThan: AdditionEvaluation, ForwardApplication,
  RegressiveProductProcessingOrder, SandwichProductProcessingOrder
  lowerThan: MultiplicationPrecedence, AdditionPrecedence, AssignmentPrecedence
}

infix operator |*|:GeometricProductProcessingOrder

func |*|<A:FloatingPoint>(_ lhs:A, _ rhs:A) -> A {
  lhs * rhs
}

func |*|<A:FloatingPoint>(_ lhs:[A], _ rhs:[A]) -> A {
  lhs.reduce(1, |*|) |*| rhs.reduce(1, |*|)
}

func |*|<A:FloatingPoint>(_ lhs:A, _ rhs:e) -> (A, [e]) {
  (lhs |> vectorize) |*| (rhs |> unitVector >>> arrayfySecond)
}

func |*|<A:FloatingPoint>(_ lhs:e, _ rhs:A) -> (A, [e]) {
  (lhs |> unitVector >>> arrayfySecond) |*| (rhs, [])
}

func |*|<A:FloatingPoint>(_ lhs:[A], _ rhs:e) -> (A, [e]) {
  (lhs.reduce(1, *) |> vectorize ) |*| (rhs |> unitVector >>> arrayfySecond)
}

func |*|<A:FloatingPoint>(_ lhs:e, _ rhs:[A]) -> (A, [e]) {
  (lhs |> unitVector >>> arrayfySecond) |*| (rhs.reduce(1, *) |> vectorize )
}

func |*|<A:FloatingPoint>(_ lhs:e, _ rhs:e) -> (A, [e]) {
  (lhs |> unitVector) |*| (rhs |> unitVector)
}

func |*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,e)) -> (A, [e]) {
  (lhs |> arrayfySecond) |*| (rhs |> arrayfySecond)
}

func evaluateResidual<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A, [e])) -> (A, [e]) {
  var retVal:(A, [e]) = (lhs.0|*|rhs.0, (lhs.1 + rhs.1)) |> normalized
  retVal.1 = (retVal.1 |> removeDuplicates)
  return retVal
}

func |*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,[e])) -> (A, [e]) {
  if (lhs |> isCoefficientZero) && (rhs |> isCoefficientZero) { return zeroVector() }
  else if lhs |> isCoefficientZero { return rhs |> normalized }
  else if rhs |> isCoefficientZero { return lhs |> normalized }
  else if ((lhs.1, e(0)) |> contains) && ((rhs.1, e(0)) |> contains) {
    return zeroVector()
  } else {
    return (lhs, rhs) |> evaluateResidual
  }
}

func |*|<A:FloatingPoint>(_ lhs:[(A,[e])], _ rhs:[(A,[e])]) -> [(A, [e])] {
  var retVal = [(A, [e])]()
  for lmlv in lhs {
    for rmlv in rhs {
      retVal.append((lmlv |*| rmlv))
    }
  }
  return reduce(with: |+|, retVal |> compactMap)
}

func |*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,e)) -> (A, [e]) {
  lhs |*| (rhs |> arrayfySecond)
}

func |*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> arrayfySecond) |*| rhs
}

func |*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:e) -> (A, [e]) {
  lhs |*| (rhs |> arrayfy)
}

func |*|<A:FloatingPoint>(_ lhs:e, _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> arrayfy) |*| rhs
}

func |*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:[e]) -> (A, [e]) {
  lhs |*| (rhs |> unitVector)
}

func |*|<A:FloatingPoint>(_ lhs:[e], _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> unitVector) |*| rhs
}

func |*|<A:FloatingPoint>(_ lhs:[e], _ rhs:[e]) -> (A, [e]) {
  (lhs |> unitVector) |*| (rhs |> unitVector)
}

public func |*|<A:FloatingPoint> (_ lhs:A, _ rhs:(A, e)) -> (A,[e]) {
  (lhs |*| rhs.0, rhs.1) |> arrayfySecond
}

public func |*|<A:FloatingPoint> (_ lhs:(A,e), _ rhs:A) -> (A, [e]) {
  (lhs.0 |*| rhs, lhs.1) |> arrayfySecond
}

public func |*|<A:FloatingPoint> (_ lhs:A, _ rhs:(A, [e])) -> (A,[e]) {
  (lhs |*| rhs.0, rhs.1)
}

public func |*|<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs:A) -> (A, [e]) {
  (lhs.0 |*| rhs, lhs.1)
}
