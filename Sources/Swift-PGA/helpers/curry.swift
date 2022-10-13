import Foundation

internal func curry<A,B,R>(_ f:@escaping (A,B) -> R) -> (A) -> (B) -> R {
  return { a in { b in f(a,b) } }
}

internal func curry<A,B,C,R>(_ f:@escaping (A,B,C) -> R) -> (A) -> (B) -> (C) -> R{
  return { a in { b in { c in  f(a,b,c) } } }
}

internal func curry<A,B,C,D,R>(_ f:@escaping (A,B,C,D) -> R) -> (A) -> (B) -> (C) -> (D) -> R{
  return { a in { b in { c in  { d in f(a,b,c,d) } } } }
}

internal func curry<A,B,C,D,E,R>(_ f:@escaping (A,B,C,D,E) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> R{
  return { a in { b in { c in  { d in { e in f(a,b,c,d,e) } } } } }
}
