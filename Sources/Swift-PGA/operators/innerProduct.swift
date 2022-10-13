
import Foundation

infix operator |||:GeometricProductProcessingOrder

func |||<A:FloatingPoint>(_ lhs:A, _ rhs:A) -> A {
  lhs * rhs
}

func |||<A:FloatingPoint>(_ lhs:[A], _ rhs:[A]) -> A {
  lhs.reduce(1, |||) ||| rhs.reduce(1, |||)
}

func |||<A:FloatingPoint>(_ lhs:A, _ rhs:e) -> (A, [e]) {
  (lhs, rhs) |> arrayfySecond
}

func |||<A:FloatingPoint>(_ lhs:e, _ rhs:A) -> (A, [e]) {
  (rhs, lhs) |> arrayfySecond
}

func |||<A:FloatingPoint>(_ lhs:[A], _ rhs:e) -> (A, [e]) {
  (lhs.reduce(1, *), []) ||| (rhs |> unitVector >>> arrayfySecond)
}

func |||<A:FloatingPoint>(_ lhs:e, _ rhs:[A]) -> (A, [e]) {
  (lhs |> unitVector >>> arrayfySecond) ||| (rhs.reduce(1, *), [])
}

func |||<A:FloatingPoint>(_ lhs:e, _ rhs:e) -> (A, [e]) {
  (lhs |> unitVector) ||| (rhs |> unitVector)
}

func |||<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,e)) -> (A, [e]) {
  (lhs |> arrayfySecond) ||| (rhs |> arrayfySecond)
}

func evaluate<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A, [e])) -> (A, [e]) {
  var retVal:(A, [e]) = normalized((lhs.0|||rhs.0, (lhs.1 + rhs.1)))
  retVal.1 = (retVal.1 |> removeDuplicates)
  return retVal 
}

func |||<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,[e])) -> (A, [e]) {
  if (lhs |> isCoefficientZero) && (rhs |> isCoefficientZero) { return zeroVector() }
  else if lhs |> isCoefficientZero { return rhs |> normalized }
  else if rhs |> isCoefficientZero { return lhs |> normalized }
  else {
    let lhsGrade = lhs |> grade
    let rhsGrade = rhs |> grade
    
    if (lhsGrade == 0 || rhsGrade == 0) { return zeroVector() }
    else if lhsGrade == 1 {
      if !contains(rhs.1, lhs.1.first!) { return zeroVector() }
      else {
        return (lhs, rhs) |> evaluate
      }
    }
    else if rhsGrade == 1 {
      if !contains(lhs.1, rhs.1.first!) { return zeroVector() }
      else {
        return (lhs, rhs) |> evaluate
      }
    } else {
      if contains(rhs.1, e(0)) && contains(lhs.1, e(0)) {
        return zeroVector()
        
      } else {
        var matchCount = 0
        for x in 0..<grade(lhs) {
          if contains(rhs.1, lhs.1[Int(x)]) { matchCount += 1 }
        }
        if matchCount == grade(lhs) { return evaluate(lhs, rhs) }
        
        matchCount = 0
        for x in 0..<grade(rhs) {
          if contains(lhs.1, rhs.1[Int(x)]) { matchCount += 1 }
        }
        if matchCount == grade(rhs) { return evaluate(lhs, rhs) }
        else { return zeroVector() }
      }
    }
  }
}

func |||<A:FloatingPoint>(_ lhs:[(A,[e])], _ rhs:[(A,[e])]) -> [(A, [e])] {
  var retVal = [(A, [e])]()
  for lmlv in lhs {
    for rmlv in rhs {
      retVal.append((lmlv ||| rmlv))
    }
  }
  return reduce(with: |+|, retVal |> compactMap)
}

func |||<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,e)) -> (A, [e]) {
  lhs ||| (rhs |> arrayfySecond)
}

func |||<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> arrayfySecond) ||| rhs
}

func |||<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:e) -> (A, [e]) {
  lhs ||| (rhs |> arrayfy)
}

func |||<A:FloatingPoint>(_ lhs:e, _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> arrayfy) ||| rhs
}

func |||<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:[e]) -> (A, [e]) {
  lhs ||| (rhs |> unitVector)
}

func |||<A:FloatingPoint>(_ lhs:[e], _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> unitVector) ||| rhs
}

func |||<A:FloatingPoint>(_ lhs:[e], _ rhs:[e]) -> (A, [e]) {
  (lhs |> unitVector) ||| (rhs |> unitVector)
}

public func |||<A:FloatingPoint> (_ lhs:A, _ rhs:(A, e)) -> (A,[e]) {
  (lhs ||| rhs.0, rhs.1) |> arrayfySecond
}

public func |||<A:FloatingPoint> (_ lhs:(A,e), _ rhs:A) -> (A, [e]) {
  (lhs.0 ||| rhs, lhs.1) |> arrayfySecond
}

public func |||<A:FloatingPoint> (_ lhs:A, _ rhs:(A, [e])) -> (A,[e]) {
  (lhs ||| rhs.0, rhs.1)
}

public func |||<A:FloatingPoint> (_ lhs:(A,[e]), _ rhs:A) -> (A, [e]) {
  (lhs.0 ||| rhs, lhs.1)
}
