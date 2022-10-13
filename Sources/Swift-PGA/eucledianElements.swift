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
