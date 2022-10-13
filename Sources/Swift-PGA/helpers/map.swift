import Foundation

internal func map<A,B>(_ f:@escaping (A)->B) -> ([A]) -> [B] {
  return { xs in
    xs.map(f)
  }
}

