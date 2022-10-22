import Foundation

public func gain<A:Numeric>(on f: @escaping (A) -> A, with x:A) -> (A) -> A {
  return { a in gain(on: f(a), with: x) }
}

public func gain<A:Numeric>(on input:A, with g:A) -> A {
  input * g
}

fileprivate func nrBydr<A:BinaryFloatingPoint>(_ nr:A, _ dr:A) -> A {
  if dr == A.zero { fatalError("Divided by zero error!") }
  return nr/dr
}

public func velocity<A:BinaryFloatingPoint>(_ distance:A, _ time:A) -> A {
  (distance,time) |> nrBydr
}

public func acceleration<A:BinaryFloatingPoint>(_ velocity:A, _ time:A) -> A {
  (velocity, time) |> nrBydr
}

public func force<A:BinaryFloatingPoint>(_ mass:A, _ accleration:A) -> A {
  mass * accleration
}

public func density<A:BinaryFloatingPoint>(_ mass:A, _ volume:A) -> A {
  (mass, volume) |> nrBydr
}

public func weight<A:BinaryFloatingPoint>(_ mass:A, _ gravity:A) -> A {
  mass * gravity
}

public func pressure<A:BinaryFloatingPoint>(_ force:A, _ area:A) -> A {
  (force, area) |> nrBydr
}

public func kineticEnergy<A:BinaryFloatingPoint>(_ mass:A, _ velocity:A) -> A {
  0.5 * mass * velocity * velocity
}

public func momentum<A:BinaryFloatingPoint>(_ mass:A, _ velocity:A) -> A {
  mass * velocity
}
