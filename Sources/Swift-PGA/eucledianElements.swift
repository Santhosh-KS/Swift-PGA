import Foundation

// https://bivector.net/3DPGA.pdf
public struct Point<A:FloatingPoint> {
  var x:(A, [e])
  var y:(A, [e])
  var z:(A, [e])
  var c:(A, [e])
}

//P = xe032 + ye013 + ze021 + e123
public extension Point where A == Double {
  static var `default`:() -> Point<Double> = {
    Point(x: e032,y: e013, z: e021, c: e123)
  }
}

public extension Point where A == Float {
  static let `default` = {
    Point(x: (1, [e(0), e(3), e(2)]),
          y: (1, [e(0), e(1), e(3)]),
          z: (1, [e(0), e(2), e(1)]),
          c: (1, [e(1), e(2), e(3)]))
  }
}


extension Point: CustomStringConvertible {
  public var description: String {
    "\(x |> stringify) + \(y |> stringify) + \(z |> stringify ) + \(c |> stringify)"
  }
}

public func idealPoint<A:FloatingPoint>(_ p:Point<A>) -> [(A, [e])] {
  p
  |> set(^\Point.c , (0, []))
  |> point
}

public func direction<A:FloatingPoint>(_ p:Point<A>) -> [(A, [e])] {
  p |> idealPoint
}

public func point<A:FloatingPoint>(_ p:Point<A>) -> [(A, [e])] {
  p.x |+| p.y |+| p.z |+| p.c
}

let P = Point<Double>.default()
// Ideal point (direction) (x, y, z) P = xe032 + ye013 + ze021
public let defaultPoint = P
//public var defaultIdealPoint = P |> idealPoint
//public let defaultDirection = P |> idealPoint

//Plane ax + by + cz + d = 0
//p = ae1 + be2 + ce3 + de0
public struct Plane<A:FloatingPoint> {
  var a:(A, e)
  var b:(A, e)
  var c:(A, e)
  var d:(A, e)
}

public extension Plane where A == Double {
  static let `default` = {
    Plane(a: (1, e(1)), b: (1, e(2)), c: (1, e(3)), d: (1, e(0)))
  }
}

public extension Plane where A == Float {
  static let `default` = {
    Plane(a: (1, e(1)), b: (1, e(2)), c: (1, e(3)), d: (1, e(0)))
  }
}

extension Plane:CustomStringConvertible {
  public var description: String {
    "\(a |> stringify) + \(b |> stringify) + \(c |> stringify ) + \(d |> stringify)"
  }
}

public func plane<A:FloatingPoint>(_ p:Plane<A>) -> [(A, [e])] {
  p.a |+| p.b |+| p.c |+| p.d
}

let p = Plane<Double>.default()
public let defaultPlane = p

public func getPoint(x:Double,y:Double,z:Double,c:Double=1) -> Point<Double> {
  P |> set(^\.x.0, x)
  |> set(^\.y.0, y)
  |> set(^\.z.0, z)
  |> set(^\.c.0, c)
}

public func getPoint(x:Float,y:Float,z:Float,c:Float=1) -> Point<Float> {
  Point<Float>.default() |> set(^\.x.0, x)
  |> set(^\.y.0, y)
  |> set(^\.z.0, z)
  |> set(^\.c.0, c)
}


// https://enki.ws/ganja.js/examples/coffeeshop.html#NSELGA

// R = R0 + R1 e01 + R2 e02 + R3 e03 + R4 e12 + R5 e31 + R6 e23 + R7 e0123
// B = B0 e01 + B1 e02 + B2 e03 + B3 e12 + B4 e31 + B5 e23

public struct Rotor<A:FloatingPoint> {
  let basis = [ [], [e(0), e(1)], [e(0), e(2)], [e(0), e(3)],
                    [e(1), e(2)], [e(3), e(1)], [e(2), e(3)],
                    [e(0), e(1), e(2), e(3)]
              ]
  var coefficients = Array<A>(repeating: A.zero, count: 8)
  var r0:A
  var r1:(A, [e])
  var r2:(A, [e])
  var r3:(A, [e])
  var r4:(A, [e])
  var r5:(A, [e])
  var r6:(A, [e])
  var r7:(A, [e])
}

extension Rotor {
  public init() {
    let one:A = 1
    self.init(with:one)
  }
  
  public init(r0:A, r1:A, r2:A, r3:A, r4:A, r5:A, r6:A, r7:A) {
    self.r0 = r0
    self.r1 = (r1 |*| [e(0), e(1)])
    self.r2 = (r2 |*| [e(0), e(2)])
    self.r3 = (r3 |*| [e(0), e(3)])
    self.r4 = (r4 |*| [e(1), e(2)])
    self.r5 = (r5 |*| [e(3), e(1)])
    self.r6 = (r6 |*| [e(2), e(3)])
    self.r7 = (r7 |*| [e(0), e(1), e(2), e(3)])
  }
  
  public init(with coeff:A) {
    self.r0 = coeff
    self.r1 = (coeff |*| [e(0), e(1)])
    self.r2 = (coeff |*| [e(0), e(2)])
    self.r3 = (coeff |*| [e(0), e(3)])
    self.r4 = (coeff |*| [e(1), e(2)])
    self.r5 = (coeff |*| [e(3), e(1)])
    self.r6 = (coeff |*| [e(2), e(3)])
    self.r7 = (coeff |*| [e(0), e(1), e(2), e(3)])
  }
}

public extension Rotor {
  func Normalized() -> Self {
    let sqrt:A = sqrt(r0 * r0 + r4.0 * r4.0 + r5.0 * r5.0 + r6.0 * r6.0)
    let s:A = A(1)/sqrt
    let d:A = (r7.0*r0 - ((r1.0*r6.0) + (r2.0*r5.0) + (r3.0*r4.0)))*s*s
    var rotor = self
    rotor.r0 = s * self.r0
    rotor.r4.0 = s * self.r4.0
    rotor.r5.0 = s * self.r5.0
    rotor.r6.0 = s * self.r6.0
    rotor.r1.0 = (s * self.r1.0) + (rotor.r6.0 * d)
    rotor.r2.0 = (s * self.r2.0) + (rotor.r5.0 * d)
    rotor.r3.0 = (s * self.r3.0) + (rotor.r4.0 * d)
    rotor.r7.0 = (s * self.r7.0) - (rotor.r0 * d)
    return rotor
  }
}

public extension Rotor {
  func SquareRoot() -> Self {
    var rotor = self
    rotor.r0 = self.r0 + 1
    rotor.r1.0 = self.r1.0 + 1
    rotor.r2.0 = self.r2.0 + 1
    rotor.r3.0 = self.r3.0 + 1
    rotor.r4.0 = self.r4.0 + 1
    rotor.r5.0 = self.r5.0 + 1
    rotor.r6.0 = self.r6.0 + 1
    rotor.r7.0 = self.r7.0 + 1
    return rotor.Normalized()
  }
}
