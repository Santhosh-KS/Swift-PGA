
import Foundation

func getTable() -> [(Double, [e])] {
//  let grade1 = [(1, [e(0)]), (1, [e(1)]), (1, [e(2)]), (1, [e(3)])]
  var table:[(Double, [e])] = [(1, [e(0)]), (1, [e(1)]), (1, [e(2)]), (1, [e(3)])]
  table += [(1,[e(0), e(1)]),
            (1,[e(0), e(2)]),
            (1,[e(0), e(3)]),
            (1,[e(1), e(2)]),
            (1,[e(3), e(1)]),
            (1,[e(2), e(3)])]
  table += [(1,[e(0), e(2), e(1)]),
            (1,[e(0), e(1),e(3)]),
            (1,[e(0), e(3), e(2)]),
            (1,[e(1), e(2), e(3)]),
            (1,[e(0), e(1), e(2), e(3)])]
  return table
}

func printGeometricProductTable() -> String {
  let table:[(Double, [e])] = getTable()
  return tabulate(table, with: |*|).joined(separator: "\n")
}

func printInnerProductTable() -> String {
  let table:[(Double, [e])] = getTable()
  return tabulate(table, with: |||).joined(separator: "\n")
}

func printOuterProductTable() -> String {
  let table:[(Double, [e])] = getTable()
  return tabulate(table, with: |^|).joined(separator: "\n")
}

func printRegressiveProductTable() -> String {
  let table:[(Double, [e])] = getTable()
  return tabulate(table, with: |^*|).joined(separator: "\n")
}

func printSandwichProductTable() -> String {
  let table:[(Double, [e])] = getTable()
  return tabulate(table, with: |<*>|).joined(separator: "\n")
}

func shorthand(_ xs:[e]) -> String {
  xs.map { val in "\(val.index)" }.joined(separator: "")
}

func header (_ xs:[[e]]) -> String {
  var header = "||"
 
  for x in xs {  header += "e\(shorthand(x))|"  }
  header += "\n"
  let l = Array<String>.init(repeating: ":---:",
                             count: xs.count+1).joined(separator: "|")
  header += l
  return header
}

func tabulate<A:FloatingPoint & Comparable>(_ xs:[(A,[e])],
                                      with f:(_ lhs:(A,[e]), _ rhs:(A,[e])) -> [(A, [e])])-> [String] {
  var retVal = [String]()
  retVal.append(header(xs.map { $0.1 }))
  
  for g in xs {
    var k = "|e\(shorthand(g.1)) |"
    for i in xs {
      let v = f(g,i)
      if v.isEmpty {
        k += " 0 |"
      } else {
        k += "\((v.first!.0) > A.zero ? "" : " -" )"
        k += (v.first!.1.isEmpty ? "1" : ("e" + "\(shorthand(v.first!.1))")) + " |"
      }
    }
    retVal.append(k)
  }
  return retVal
}

func tabulate<A:FloatingPoint & Comparable>(_ xs:[(A,[e])],
                                      with f:(_ lhs:(A,[e]), _ rhs:(A,[e])) -> (A, [e]))-> [String] {
  var retVal = [String]()
  retVal.append(header(xs.map { $0.1 }))
  
  for g in xs {
    var k = "|e\(shorthand(g.1)) |"
    for i in xs {
      let v = f(g,i)
      if v.0 == 0 {
        k += " 0 |"
      } else {
        k += "\((v.0) > A.zero ? "" : " -" )"
        k += (v.1.isEmpty ? "1" : ("e" + "\(shorthand(v.1))")) + " |"
      }
    }
    retVal.append(k)
  }
  return retVal
}

func stringify<A:FloatingPoint>(_ vec:(A, [e])) -> String {
  "\(vec.0)\(vec.1.first == nil ? "" : "*e")\(vec.1.map { String($0.index) }.joined())"
}

func stringify<A:FloatingPoint>(_ vec:(A, e)) -> String {
  stringify((vec.0, [vec.1]))
}

func stringify(multivector mv:[(Double, [e])], separator:String) -> String {
  mv.map(stringify).joined(separator:separator)
}

func printReverseTable() -> String {
  let table = getTable()
  let hedr = header(table.map{ val in  val.1 }) + "|\n"
  return hedr + "|Reverse|" + table.map{ |~|$0 }.map(stringify).joined(separator: " | ") + "|"
}

func printDualTable() -> String {
  let table = getTable()
  let hedr = header(table.map{ val in  val.1 }) + "|\n"
  return hedr + "|Dual|" + table.map{ |!|$0 }.map(stringify).joined(separator: " | ") + "|"
}
