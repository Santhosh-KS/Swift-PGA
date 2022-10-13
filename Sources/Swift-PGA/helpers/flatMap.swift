import Foundation

internal func flatmap<A>(_ a:[[A]]) -> [A] {
  var retVal = [A]()
  a.forEach { elements in
    if !elements.isEmpty {
      retVal.append(contentsOf: elements)
    }
  }
  return retVal
}

internal func compactMap<A:FloatingPoint>(_ xs:[(A, [e])]) -> [(A, [e])] {
  var retVal = [(A,[e])]()
  xs.forEach { pair in
    if pair != zeroVector() {
      if pair.0 != A.zero {
        retVal.append(pair)
      }
    }
  }
  return retVal
}
