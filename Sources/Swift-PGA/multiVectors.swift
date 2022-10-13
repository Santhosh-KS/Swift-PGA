import Foundation

protocol MultiVectorEvalator {
  associatedtype Epsilon
  associatedtype Scalar
  func basisVectors (_ lhs:Epsilon, _ rhs:Epsilon) -> Scalar
  func evaluate (expression:[(Scalar, [Epsilon])]) -> [(Scalar, [Epsilon])]
}

public struct MultiVector<DataType:Numeric> {
  let  Positive:UInt8
  let  Negetive:UInt8
  let  Zero:UInt8
}

extension MultiVector {
  // Defualt init gives 3D-PGA R(3,0,1) domain
  public init() {
    self.Positive = 3
    self.Negetive = 0
    self.Zero = 1
  }
}

extension MultiVector: MultiVectorEvalator {
  typealias Scalar = DataType
  typealias Epsilon = e
  
  func basisVectors(_ lhs: e, _ rhs: e) -> DataType {
    if lhs == rhs && lhs.index  <= Positive && rhs.index <= Positive{
      if lhs == e(0) { return 0 }
      return 1
    }
    fatalError("\(lhs) != \(rhs).Domain cannot be calculated on hetrogeneious types.")
  }
  
  func evaluate(expression: [(DataType, [e])]) -> [(DataType, [e])] {
    fatalError()
  }
}
