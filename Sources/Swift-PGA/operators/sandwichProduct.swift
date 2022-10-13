precedencegroup SandwichProductProcessingOrder {
  associativity:left
  higherThan: AdditionEvaluation, ForwardApplication
  lowerThan: MultiplicationPrecedence, AdditionPrecedence
}

infix operator |<*>|:SandwichProductProcessingOrder

public func |<*>|<A:FloatingPoint>(_ lhs:A, _ rhs:A) -> A {
  lhs * rhs * lhs
}

public func |<*>|<A:FloatingPoint>(_ lhs:[A], _ rhs:[A]) -> A {
  lhs.reduce(1, |*|) |<*>| rhs.reduce(1, |*|)
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,e)) -> (A, [e]) {
  (lhs |> arrayfySecond) |<*>| (rhs |> arrayfySecond)
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,[e])) -> (A, [e]) {
  if lhs.1 == [e(0)] || rhs.1 == [e(0)] { return zeroVector() }
  else { return (lhs |*| rhs |*| |~|lhs) |> flipSign }
}

public func |<*>|<A:FloatingPoint>(_ lhs:A, _ rhs:e) -> (A,[e]){
  (lhs |*| rhs |*| |~|lhs) |> flipSign
}

// (A,[e]) as return is expected.  Here 'lhs' is a vector and 'rhs' is a scalar
// so e |*| ~e returns [e]
public func |<*>|<A:FloatingPoint>(_ lhs:e, _ rhs:A) -> (A,[e]){
  ((lhs |> unitVector) |*| rhs |*| |~|(lhs |> unitVector)) |> flipSign
}

// (A,[e]) as return is expected. Here 'lhs' is a vector and 'rhs' is a scalar
// so (A, e) |*| ~(A, e) returns (A, [e])
public func |<*>|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:A) -> (A, [e]) {
  (lhs |*| rhs |*| |~|lhs) |> flipSign
}

public func |<*>|<A:FloatingPoint>(_ lhs:A, _ rhs:(A,e)) -> (A, [e]) {
  (lhs |*| rhs |*| |~|lhs) |> flipSign
}

public func |<*>|<A:FloatingPoint>(_ lhs:e, _ rhs:e) -> (A, [e]) {
  (lhs |> unitVector) |<*>| (rhs |> unitVector)
}

public func |<*>|<A:FloatingPoint>(_ lhs:e, _ rhs:(A,e)) -> (A, [e]) {
  (lhs |> unitVector) |<*>| rhs
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:e) -> (A, [e]) {
  lhs |<*>| (rhs |> unitVector)
}

public func |<*>|<A:FloatingPoint>(_ lhs:[e], _ rhs: (A,[e])) -> (A, [e]) {
  (lhs |> unitVector) |<*>| rhs
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs: [e]) -> (A, [e]) {
  lhs |<*>| (rhs |> unitVector)
}

public func |<*>|<A:FloatingPoint>(_ lhs:[e], _ rhs: [e]) -> (A, [e]) {
  (lhs |> unitVector) |<*>| (rhs |> unitVector)
}

public func |<*>|<A:FloatingPoint>(_ lhs:A, _ rhs:(A,[e])) -> (A, [e]) {
  (lhs |> vectorize) |<*>| rhs
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:A) -> (A, [e]) {
  lhs |<*>| (rhs |> vectorize)
}

public func |<*>|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:e) -> (A, [e]) {
  lhs |<*>| (rhs |> unitVector >>> arrayfySecond)
}

public func |<*>|<A:FloatingPoint>(_ lhs:e, _ rhs: (A,[e])) -> (A, [e]) {
  (lhs |> unitVector >>> arrayfySecond) |<*>| rhs
}


