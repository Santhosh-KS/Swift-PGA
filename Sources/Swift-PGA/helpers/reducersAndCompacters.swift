import Foundation


internal func reduce<A>(with f:@escaping (A, A) -> A,
                        _ xs:[(A,[e])]) -> [(A,[e])] {
  var result = [(A,[e])]()
  xs.forEach { pair in
    var index = 0
    if zip((0...),result).contains(where: { indexBvPair in
      index = indexBvPair.0
      let bv = indexBvPair.1
      return bv.1 == pair.1
    }) {
      result[index] = (f(result[index].0, pair.0), pair.1)
    } else {
      result.append(pair)
    }
  }
  return result.sorted { p1, p2 in
    p1.1.count < p2.1.count
  }
}

