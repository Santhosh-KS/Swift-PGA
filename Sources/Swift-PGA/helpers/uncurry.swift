internal func uncurry<A,B,R>(_ f:@escaping
(A)->(B)->R) -> (A,B) -> R {
  return { (a:A, b:B) -> R in f(a)(b) }
}

internal func uncurry<A,B,C,R>(_ f:@escaping
(A)->(B)->(C)->R) -> (A,B,C) -> R {
  return { (a:A, b:B, c:C) -> R in f(a)(b)(c) }
}

internal func uncurry<A,B,C,D,R>(_ f:@escaping
(A)->(B)->(C)->(D)->R) -> (A,B,C,D) -> R {
  return { (a:A, b:B, c:C, d:D) -> R in f(a)(b)(c)(d) }
}
