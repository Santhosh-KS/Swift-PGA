// TODO: Inverse operation is not supported yet.
  //postfix operator |-||
//// NOTE: Current version of Inverse is not correct!!
//
//
//public postfix func |-||<A:FloatingPoint>(_ basis:(A,e)) -> (A, e) {
//  (basis.0|-||, basis.1)
//}
//
//public postfix func |-||<A:FloatingPoint>(_ basis:e) -> (A, e) {
//  (1, basis)|-||
//}
//
//public postfix func |-||<A:FloatingPoint>(_ basis:(A, [e])) -> (A, [e]) {
//  let reverse = |~|(A(1), basis.1)
//  let reveresedScalar = Inverse(of: basis.0) ||| reverse.0
//  return ( reveresedScalar , reverse.1)
//}
//
//// TODO: Fix the Inverse.
//// Since there is no Inverse operation listed in https://bivector.net/tools.html
//// Not sure how to implement the same for domain with e(0) as scalar.
//// A |*| Inverse(A) = 1 is not being satisfied even after multiple trys.
//// May be using |*| is not to correct operation here. Need to revist this portion of code.
//// TODO: https://vixra.org/pdf/1901.0246v1.pdf
//// https://discourse.bivector.net/t/why-there-is-no-inverse-operator-defined-in-bivector-net/608
//public postfix func |-||<A:FloatingPoint>(_ input:[(A, [e])]) -> [(A, [e])] {
//  let conj = input.map(conjugate)
//  print("input = ", input)
//  print("Conjugate = ", conj)
//  let dr = input |*| conj
//  print("dr = ",dr)
//  let constdr = dr.map { pairs in pairs.0 * pairs.0 }.reduce(0, +)
//  print("constdr = ", constdr)
//  let result = conj.map { pairs in (pairs.0/constdr, pairs.1)}
////  let result = (1/constdr) |*| conj
//  return result
//}
//
///*
// public postfix func |-||<A:FloatingPoint>(_ input:[(A, [e])]) -> [(A, [e])] {
//  let conj = input.map(conjugate)
//  print("input = ", input)
//  print("Conjugate = ", conj)
////  let numerator = input |*| conjugate
////  print("numerator = ", numerator)
//  // Inv(A) = Conjugate(A) / Magnitude(A)
//  var result = [(A, [e])]()
//  let grades:[UInt8] = [0,1,2,3]
//  var gc = [(grade:UInt8, constant:A)]()
//  var dr = [A]()
//  for g in grades {
//    let vecs = grade(with: g, in: input)
//    for vec in vecs {
//      let conj_vec = conjugate(vec)
//      let c = vec |*| conj_vec
//      print("vec = \(vec): grade = \(g) : \(c)")
//      if c.isEmpty {
//        gc.append((g, 1))
////        result.append((vec.0, []))
//        dr.append(A(1*1))
//      }
//      else {
//        gc.append((g, c.first!.0))
////        result.append((vec.0 |*| Inverse(of:c.first!.0), vec.1))
//        dr.append(c.first!.0 * c.first!.0)
//      }
//    }
//  }
//  print("dr = ", dr)
//  let conjConst  = dr.reduce(0, |+|)
//  print("conjConst = ", conjConst)
//  result = conj.map({ pairs in (pairs.0/conjConst, pairs.1) })
//  return result
//}
// */
//
//public postfix func |-||<A:Numeric & FloatingPoint >(_ val:A) -> A {
//  if val == 0  { return val }
//  return 1/val
//}
//
//
//public func Inverse<A:FloatingPoint>(of val:A) -> A {
//  val|-||
//}
//
//public func Inverse<A:FloatingPoint>(of basis:(A,e)) -> (A, e) {
//  basis|-||
//}
//
//public func Inverse<A:FloatingPoint>(of basis:e) -> (A,e) {
//  basis|-||
//}
//
//public func Inverse<A:FloatingPoint>(of basis:(A,[e])) -> (A, [e]) {
//  basis|-||
//}
