import Foundation

// https://enki.ws/ganja.js/examples/coffeeshop.html#NSELGA


// MARK : Rotor
// R = R0 + R1 e01 + R2 e02 + R3 e03 + R4 e12 + R5 e31 + R6 e23 + R7 e0123


public struct Rotor<A:FloatingPoint> {
  var coefficients:[A]
  var basis: () -> [[e]]
}

public extension Rotor {
  init() {
    self.basis = { [[], [e(0), e(1)], [e(0), e(2)], [e(0), e(3)],
                     [e(1), e(2)], [e(3), e(1)], [e(2), e(3)],
                     [e(0), e(1), e(2), e(3)]] }
    self.coefficients = Array.init(repeating: 1, count: self.basis().count)
  }
}

extension Rotor:CustomStringConvertible {
  public var description: String {
    let z = zip2(coefficients, basis())
    return z.map(stringify).joined(separator: " + ")
  }
}

func normalized<A:FloatingPoint>(_ rotor:Rotor<A>) -> Rotor<A> {
  let indexes_0456 = [0,4,5,6]
  // TODO: Check if all 8 co-efficients are present
  // s = 1/Math.sqrt((R[0]*R[0] + R[4]*R[4] + R[5]*R[5] + R[6]*R[6]));
  let s = A(1) / (indexes_0456.map{ idx in
    rotor.coefficients[idx] * rotor.coefficients[idx]
  }.reduce(0, +) |> sqrt)

  // d = (R[7]*R[0] - (R[1]*R[6] + R[2]*R[5] + R[3]*R[4]))*s*s;
  let d_indexPairs = zip2([7,1,2,3], [0,6,5,4])
  let d1 = d_indexPairs.map { (idx1, idx2) in
    rotor.coefficients[idx1] * rotor.coefficients[idx2]
  }
  let d2 = d1.first! // R[7]*R[0]
  let d = (d2 - d1.dropFirst().reduce(0, +))*s*s

  var r1 = rotor |> set(^\.coefficients, rotor.coefficients.map { $0 * s})
  
  let _ = d_indexPairs.map { (idx1, idx2) in
    if (idx1 == 7 && idx2 == 0) {
     return r1.coefficients[idx1] -= r1.coefficients[idx2] * d
    } else {
      return r1.coefficients[idx1] += r1.coefficients[idx2] * d
    }
  }
  return r1
}

public func squareRoot<A:FloatingPoint>(_ rotor:Rotor<A>) -> Rotor<A> {
//  normalize(1 + R)
 rotor |> set(^\.coefficients, rotor.coefficients.map { $0 + 1})
       |> normalized
}

/// BiVector
// B = B0 e01 + B1 e02 + B2 e03 + B3 e12 + B4 e31 + B5 e23
public struct Bivector<A:FloatingPoint> {
  var coefficients:[A]
  var basis: () -> [[e]]
}

public extension Bivector {
  init() {
    self.basis = { [[e(0), e(1)], [e(0), e(2)], [e(0), e(3)],
                    [e(1), e(2)], [e(3), e(1)], [e(2), e(3)]] }
    self.coefficients = Array.init(repeating: 1, count: self.basis().count)
  }
}

extension Bivector:CustomStringConvertible {
  public var description: String {
    let z = zip2(coefficients, basis())
    return z.map(stringify).joined(separator: " + ")
  }
}

public func exponential(_ b:Bivector<Double>) -> Rotor<Double> {
  let indexs_345 = [3,4,5]
  //  l = (B[3]*B[3] + B[4]*B[4] + B[5]*B[5]);
  let l = indexs_345
    .map {idx in b.coefficients[idx] * b.coefficients[idx]}
    .reduce(0, +)
  if l == 0 {
  //  rotor(1, B[0], B[1], B[2], 0, 0, 0, 0);
    let coeff = [1, b.coefficients[0], b.coefficients[1], b.coefficients[2],
                 0, 0, 0, 0]
    return Rotor<Double>() |> set(^\.coefficients, coeff)
  }
  
  let indexPairs = zip2([0,1,2], [5,4,3])
  //   m = (B[0]*B[5] + B[1]*B[4] + B[2]*B[3]),
  let m = indexPairs.map { idx1, idx2 in
    b.coefficients[idx1] * b.coefficients[idx2]
  }.reduce(0, +)
  
  let a = sqrt(l)
  let c = cos(a)
  let s = sin(a)/a
  let t = m/(l*(c-s))
  
  // s*B[0] + t*B[5], s*B[1] + t*B[4], s*B[2] + t*B[3],
  let b05_14_23 = zip2([0,1,2],[5,4,3]).map { idx1, idx2 in
    s * b.coefficients[idx1] + t * b.coefficients[idx2]
  }
  
  // s*B[3], s*B[4], s*B[5]
  let b3_4_5 = indexs_345.map { idx in
    s * b.coefficients[idx]
  }
 
  let coeff = [c] + b05_14_23 + b3_4_5 + [m*s]
  
  return Rotor<Double>() |> set(^\.coefficients, coeff)
}

public func exponential(_ b:Bivector<Float>) -> Rotor<Float> {
  let b1 = Bivector<Double>() |> set(^\.coefficients,
                                     b.coefficients |> floatsToDoubles)
  let r1 = exponential(b1)
  return Rotor<Float>() |> set(^\.coefficients,
                              r1.coefficients |> doublesToFloats)
}

public func log(_ r:Rotor<Double>) -> Bivector<Double> {
  guard r.coefficients.first == 1  else {
    return Bivector<Double>() |> set(^\.coefficients,
                                  [1,2,3].map { r.coefficients[$0]} + [0,0,0])
  }
  // inverse squared length
  let a = 1 / (1 - (r.coefficients.first! * r.coefficients.first!))
  // rotation scale
  let b = acos(r.coefficients.first!) * sqrt(a)
  // translation scale
  let c = a*r.coefficients.last! * (1 - (r.coefficients.first! * b) )
  let c_61_52_43 = zip2([6,5,4],[1,2,3]).map { idx1,idx2 in
    c*r.coefficients[idx1] + b*r.coefficients[idx2]
  }
  let c_4_5_6 = [4,5,6].map { idx in b * r.coefficients[idx] }
  return Bivector<Double>() |> set(^\.coefficients, c_61_52_43 + c_4_5_6)
}

public func log(_ r:Rotor<Float>) -> Bivector<Float> {
  let r1 = Rotor<Double>() |> set(^\.coefficients,
                                  r.coefficients |> floatsToDoubles)
  let b1 = log(r1)
  return Bivector<Float>() |> set(^\.coefficients,
                                  b1.coefficients |> doublesToFloats )
}

