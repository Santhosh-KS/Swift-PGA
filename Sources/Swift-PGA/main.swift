//print("e0",e0)
//print("e1",e1)
//print("e2",e2)
//print("e3",e3)
//print("e00",e00)
//print("e01",e01)
//print("e02",e02)
//print("e03",e03)
//print("e10",e10)
//print("e11",e11)
//print("e12",e12)
//print("e13",e13)
//print("e20",e20)
//print("e21",e21)
//print("e22",e22)
//print("e23",e23)
//print("e30",e30)
//print("e31",e31)
//print("e32",e32)
//print("e33",e33)
//print("e000", e000)
//print("e001", e001)
//print("e002", e002)
//print("e003", e003)
////print("e010", e010)
//print("e011", e011)
//print("e012", e012)
//print("e013", e013)
////print("e020", e020)
//print("e021", e021)
//print("e022", e022)
//print("e023", e023)
////print("e030", e030)
//print("e031", e031)
//print("e032", e032)
//print("e033", e033)
//
//

//print(printGeometricProductTable())
//let e0_e1:(Double, [e]) = (1, e(0)) |*| (1, e(1))
//print(e0_e1)
//print(printInnerProductTable())
//print(printOuterProductTable())
print(printRegressiveProductTable())
//print(printSandwichProductTable())
//print(printReverseTable())
//print(printDualTalbe())
//
////let tmp:(Double,[e]) = e012
////print(|~|e321)
////
////print(grade(e112))
////let b = (e00 |*| e0)
////print(b)
////
////let inv1 = e12|-||
////print(inv1)
////
////print(|~|e123)
//
//// (ae12 + be23)(ae21 + be32)
//let ae12 = 10 |*| e12
//let be23 =  3 |*| e23
//let ae21 = 10 |*| e12
//let be32 =  3 |*| e32
//
//let ae12_plus_be23 = ae12 |+| be23
//let ae21_plus_be32 = ae21 |+| be32
//
//print("ae12_plus_be23 = ", ae12_plus_be23)
//print("ae21_plus_be32 = ", ae21_plus_be32)
//
//let resultGp = (ae12 |+| be23) |*| (ae21 |+| be32)
//print("resultGp = ", resultGp)
//let resultOp = (ae12 |+| be23) |^| (ae21 |+| be32)
//print("resultOp = ", resultOp)
//let resultIp = (ae12 |+| be23) ||| (ae21 |+| be32)
//print("resultIp = ", resultIp)
//
//print(grade(with: 0, in: resultGp))
//print(grade(with: 1, in: resultGp))
//print(grade(with: 2, in: resultGp))
//print(grade(with: 3, in: resultGp))
//
////print("resultIp|-|| = ", resultIp|-||)
//
////A = 1 + 2*e1 + 3*e12 + 4*e123
////var A = (1 |*| e0) |+| (2|*|e1) |+| (3|*|e12) |+| (4|*|e123)
////let A = (1.0 |*| [e(0)])
////print(A)
////e12
//
//print(|~|e12)

//let p = reduce(with: |+|, A |*| A_inv |> compactMap)
//print(p)
//1 + (2^e1) + (3^e12) + (4^e123)
// e0 + 2e1 + 3e12 + 4e123
// (e0 + 2e1 + 3e12 + 4e123) * (e0 + 2e1 + 3e12 + 4e123)
// e0*e0 + 2e1*e0 + 3e12 * e0 + 4e123 * e0
// e0*2e1 + 2e1*2e1 + 3e12*2e1 + 4e123 * 2e1
// e0*3e12 + 2e1*3e12 + 3e12*3e12 + 4e123*3e12
// e0*4e123 + 2e1*4e123 + 3e12*4e123 + 4e123*4e123

//(0.03333333333333333, []),
//(0.06666666666666667, [e(1)]),
//(-0.1, [e(1), e(2)]),
//(-0.13333333333333333, [e(1), e(2), e(3)])
//let a = 2 |*| e1
//print(a)
//
//let a_inv = a|-||
//print(a_inv)
//
//let id_a = a |*| a_inv
//print(id_a)
//
//let b = 3 |*| e12
//print(b)
//
//let b_inv = b|-||
//print(b_inv)
//
//let id_b = b |*| b_inv
//print(id_b)
//
//let c = 4 |*| e123
//print(c)
//
//let c_inv = c|-||
//print(c_inv)
//
//let id_c = c |*| c_inv
//print(id_c)

// [(Double, e)] |+| (Double, [e])
// [(A,[e])], (A, [e])
//e123
//var A = (1 |*| e0) |+| (2|*|e1) |+| (3|*|e12) |+| (4 |*| e123)
//
////print("%%%%%%%%%%%%%%%%")
//print("Input A = ", A)
//print("Conjugate A = ", conjugate(A))
//print(" A * A_conj = ", A |*| conjugate(A))
//print("A Inverse = ", A|-||)
//print("Id = ", A |*| (A|-||))
//print(e13 |*| e1)
//print(shorthand([e(3),e(1)]))

//for a in A {
//  print("dual(\(a)) = ",dual_3dpga(a))
//}
//print(dual(10) )
//print(dual(10) |^| dual(10) )
//print(10 |&*| 10)
//print(10 |&*| e1)
//print(e1 |&*| e1)
//print(dual(e1))
//print(dual(dual(e1)))
//
//print(e1 |&*| e123)
//print(e01 |*| e01)
//
//let v = (1, [e(0),e(1)]) |*| (1, [e(0),e(1)])
//print(v)
//let lhs = 10 |*| e0
//let rhs = lhs
//let gp:(Double, [e]) = lhs |*| rhs
//let gp_rev:(Double, [e]) = (rhs |*| |~|lhs)
//print(gp)
//print(gp_rev)
//
//let B_1:[(Double, [e])] = (lhs |*| rhs) |*| |~|lhs
//print(B_1)
//let B_2:[(Double, [e])] = lhs |*| (rhs |*| |~|lhs)
//print(B_2)
//
//print(3 |*| 4 |*| |~|5)

//let a = (1.0, e(1))
//let b = (1.0, e(2))
//
//print("\(a) <*> \(b) = ", a |<*>| b )
//print("\(a) <*> \(a) = ", a |<*>| a )
//print("\(b) <*> \(b) = ", b |<*>| b )
//
//print("defaultPoint = ",defaultPoint)
//print("defaultPlane = ",defaultPlane)
//A=point(0,.8,0), B=point(.8,-1,-.8), C=point(-.8,-1,-.8)
let A = getPoint(x: 0, y: 0.8, z: 0) |> point
let B = getPoint(x: 0.8, y: -1, z: -0.8) |> point
let C = getPoint(x: -0.8, y: -1, z: -0.8) |> point
let D = getPoint(x: 0.8, y: -1, z: 0.8) |> point
let E = getPoint(x: -0.8, y: -1, z: 0.8) |> point
//print("A = ", stringify(A))
//print("A = ", getPoint(x: 0, y: 0.8, z: 0))
//print("B = ", stringify(B))
//print("B = ", getPoint(x: 0.8, y: -1, z: -0.8))
//print("C = ", stringify(C))
//print("C = ", getPoint(x: -0.8, y: -1, z: -0.8))
//print("D = ", stringify(D))
//print("D = ", getPoint(x: 0.8, y: -1, z: 0.8))
//print("E = ", stringify(E))
//print("E = ", getPoint(x: -0.8, y: -1, z: 0.8))

let a_b_c_reg = (A |^*| B |^*| C) |^*| 0.1
//print(a_b_c_reg |> stringify(multivector:separator:))

let line = A |^*| B
print("line = ", line.map(stringify).joined(separator: " + "))
////var A=point(0,.8,0), B=point(.8,-1,-.8), C=point(-.8,-1,-.8), D=point(.8,-1,.8), E=point(-.8,-1,.8);
//print("E <&*> 7C = " , stringify(E |&*| C))
//let a = e0
//
//print("grade = ", grade(a))
//let rev_a = |!|a
//print("rev_a = ", rev_a)


//let wedge_ab = a |^| b
//print("a^b = ", wedge_ab)
//let gp_ab = a |*| b
//print("gp = ",gp_ab)
//let wedg_p = e01 |^| e123
//print(wedg_p)

//let dual_a = dual(a)
//print("a = ", stringify(a))
//print("dual(a) = \(stringify(dual_a))")
//let dual_b = dual(b)
//print("b = ", stringify(b))
//print("dual(b) = \(stringify(dual_b))")
//
//////let r = dual(a) |^| dual(b)
//let r = a |^*| b
//print("r = \(stringify(r))")
//let dual_r = dual(r)
//print("dual_r = \(stringify(dual_r))")
//print("dual a = ",a)
//let pseudoScalar:(Double, [e]) = (1, [e(0), e(1), e(2), e(3)])
//let dot = pseudoScalar |*| e0
//print("dot = ", dot)
//let wedge = pseudoScalar |^| a
//print("wedge = ", wedge)
//print( dot |+| wedge)

//let a = e1
//let gp = e1 |*| e1
//print("GP = ", gp)
//let rev = |~|e1
//print("rev = ", rev)
//let sp = a |<*>| a
//print("Sandwich = ", sp)
