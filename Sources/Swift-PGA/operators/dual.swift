func dual<A:FloatingPoint>(with pseudoScalar:(A,[e]), of input:(A,[e])) -> (A,[e]) {
  if input |> isCoefficientZero { return zeroVector() }
  else {
    var modifiedMulVec = [e]()
    for elem in pseudoScalar.1 {
      if !contains(input.1, elem) { modifiedMulVec.append(elem) }
    }
    let nps = (pseudoScalar.0, modifiedMulVec)
    let retVal = input |*| nps
    modifiedMulVec.removeAll()
    for elem in nps.1 {
      if !contains(input.1, elem) { modifiedMulVec.append(elem)}
    }
    return (retVal.0, modifiedMulVec)
  }
}

func dual<A:FloatingPoint>(_ input:(A,[e])) -> (A, [e]) {
  return (pseudoScalar(), input) |> dual(with:of:)
}

func dual<A:FloatingPoint>(_ input:[(A,[e])]) -> [(A, [e])] {
  input.map(dual)
}

func dual<A:FloatingPoint>(_ input:(A,e)) -> (A, [e]) {
  input |> arrayfySecond >>> dual
}

func dual<A:FloatingPoint>(_ input:e) -> (A, [e]) {
  input |> unitVector >>> arrayfySecond >>> dual
}

func dual<A:FloatingPoint>(_ input:[e]) -> (A, [e]) {
  input |> unitVector >>> dual
}

func dual<A:FloatingPoint>(_ input:A) -> (A, [e]) {
  (input, e(0)) |> dual
}

//let dual_in_3dpga:((Double, [e])) -> ((Double, [e])) = curry(dual(with:of:))(e123)

prefix operator |!|

public prefix func |!|<A:FloatingPoint>(_ input:(A,e)) -> (A, [e]) {
  input |> dual
}

prefix func |!|<A:FloatingPoint>(_ input:(A,[e])) -> (A, [e]) {
  input |> dual
}

prefix func |!|<A:FloatingPoint>(_ input:[(A,[e])]) -> [(A, [e])] {
  input |> dual
}

prefix func |!|<A:FloatingPoint>(_ input:e) -> (A, [e]) {
  input |> dual
}

prefix func |!|<A:FloatingPoint>(_ input:[e]) -> (A, [e]) {
  input |> dual
}
prefix func |!|<A:FloatingPoint>(_ input:A) -> (A, [e]) {
  input |> dual
}

prefix func |!|<A:FloatingPoint>(_ input:[A]) -> (A, [e]) {
  input.reduce(0, |+|) |> dual
}
