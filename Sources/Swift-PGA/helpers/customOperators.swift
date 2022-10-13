import Foundation
import AppKit

precedencegroup ForwardApplication {
  associativity:left
}

infix operator |>:ForwardApplication

func |> <A,B>(_ a:A, _ f:@escaping (A) -> B) -> B {
  f(a)
}

precedencegroup ForwardComposistion {
  associativity:left
  higherThan:ForwardApplication, BackwardComposition
}

infix operator >>>:ForwardComposistion

func >>> <A,B,C>(_ f:@escaping (A) -> B,
                 _ g:@escaping (B)->C) -> (A) -> C {
  return { a in g(f(a)) }
}

precedencegroup BackwardComposition {
  associativity:left
}

infix operator <<<:BackwardComposition

func <<< <A,B,C>(_ g:@escaping (B) -> C,
                 _ f: @escaping (A) -> B) -> (A) -> C {
  return { a in
    g(f(a))
  }
}
