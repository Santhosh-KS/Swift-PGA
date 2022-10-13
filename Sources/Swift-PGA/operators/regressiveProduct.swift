precedencegroup RegressiveProductProcessingOrder {
  associativity:left
  higherThan: AdditionEvaluation, ForwardApplication, SandwichProductProcessingOrder
  lowerThan: MultiplicationPrecedence, AdditionPrecedence
}

infix operator |^*|:RegressiveProductProcessingOrder

public func |^*|<A:FloatingPoint>(_ lhs:A, _ rhs:A) -> A {
  lhs * rhs
}

public func |^*|<A:FloatingPoint>(_ lhs:[A], _ rhs:[A]) -> A {
  lhs.reduce(1, |^*|) |^*| rhs.reduce(1, |^*|)
}

public func |^*|<A:FloatingPoint>(_ lhs:A, _ rhs:e) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:e, _ rhs:A) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:A, _ rhs:(A,e)) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:A) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:e) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:e, _ rhs:(A,e)) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,e)) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,[e])) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,e), _ rhs:(A,[e])) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:(A,[e]), _ rhs:(A,e)) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*|<A:FloatingPoint>(_ lhs:[(A,[e])], _ rhs:[(A,[e])]) -> [(A, [e])] {
  dual(reduce(with: |+|, dual(lhs) |^| dual(rhs)))
}

public func |^*|<A:FloatingPoint>(_ lhs:[(A,[e])], _ rhs:A) -> [(A, [e])] {
  lhs.map { pairs in (pairs.0 * rhs, pairs.1)  }
}
public func |^*|<A:FloatingPoint>(_ lhs:A, _ rhs:[(A,[e])]) -> [(A, [e])] {
  rhs |^*| lhs
}
      
public func |^*| <A:FloatingPoint>(_ lhs: e, _ rhs: e) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*| <A:FloatingPoint>(_ lhs: (A, [e]), _ rhs: e) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}
                          
public func |^*| <A:FloatingPoint>(_ lhs: e, _ rhs: (A, [e])) -> (A, [e]) {
  dual(dual(rhs) |^| dual(lhs))
}
                            
public func |^*| <A:FloatingPoint>(_ lhs: (A, [e]), _ rhs: [e]) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}
                              
public func |^*| <A:FloatingPoint>(_ lhs: [e], _ rhs: (A, [e])) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}
                                
public func |^*| <A:FloatingPoint>(_ lhs: [e], _ rhs: [e]) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}
                                  
public func |^*| <A:FloatingPoint>(_ lhs: A, _ rhs: (A, [e])) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}
                                    
public func |^*| <A:FloatingPoint>(_ lhs: (A, [e]), _ rhs: A) -> (A, [e]) {
  dual(dual(lhs) |^| dual(rhs))
}

public func |^*| <A:FloatingPoint>(_ lhs: [A], _ rhs: e) -> (A, [e]) {
  dual(dual(lhs.reduce(1, *)) |^| dual(rhs))
}

public func |^*| <A:FloatingPoint>(_ lhs: e, _ rhs: [A]) -> (A, [e]) {
  dual(lhs) |^| dual(rhs.reduce(1, *))
}

