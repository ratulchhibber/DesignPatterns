/**
 1. This Creational design pattern is used when construction may get too complicated

 2. Example - Say having 10 arguments in the initializer is not productive. Therefore, instead we opt for piecewise construction.
 
 3. Builder provides an API for constructing an object step by step(for doing the aforesaid piecewise construction).
 */

/**
 In the builder pattern-
 
 let builder = HTMLBuilder(rootName: "ul")
 builder.addChild(name: "li", text: "hello")
 builder.addChild(name: "li", text: "world")
 
 ----------
 Fluent Builder pattern-
 
 let builder = HTMLBuilder(rootName: "ul")
 // This may return a reference to HTMLBuilder itself-> This is also what you see in Page Object Model pattern for writing UITests
 builder.addChild(name: "li", text: "hello")
        .addChild(name: "li", text: "world")
        .addChild(....)// We are actually chaining the calls.
 
 -----------
 
 Faceted Builder-
 
 Different facets of an object can be built with different builders working in tandem with base class
 */

/**
 You are asked to implement the Builder design pattern for rendering simple chunks of code.

 Sample use of the builder you are asked to create:

 var cb = CodeBuilder("Person").AddField("name", "String").AddField("age", "Int");
 print(cb.description);
 The expected output of the above code is:

 class Person
 {
   var name: String
   var age: Int
 }
 Please observe the same placement of curly braces and use two-space indentation.
 */

import Foundation

class FieldElement {
  var name: String = ""
  var type: String = ""
  
  init() {}
  
  init(name: String, type: String) {
    self.name = name
    self.type = type
  }
  
  func description(_ indent: Int) -> String {
    var result = ""
    let i = String(repeating:" ", count: indent)
    
    result += i + "var " + self.name + ": " + self.type + "\n"
    return result
  }
}

class CodeBuilder : CustomStringConvertible {
  private let rootName: String
  private var fields: [FieldElement] = []
  
  init(_ rootName: String) {
    self.rootName = rootName
  }

  func addField(called name: String, ofType type: String) -> CodeBuilder {
    let field = FieldElement(name: name, type: type)
    fields.append(field)
    
    return self
  }

  public var description: String {
    var result = "class " + rootName + "\n{\n"
    
    for f in fields {
      result += f.description(2)
    }
    
    return result + "}\n"
  }
}
