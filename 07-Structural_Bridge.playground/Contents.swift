/**
 This structural design pattern Connects components together through abstractions.
 
 1. Decouples abstraction from Implementation.
 2. Both Abstraction and Implementation can exist as hierarchies.
 3. Can be thought of as a stronger form of encapsulation.
 4. Bridge Pattern prevents 'Cartesian product' complexity explosion.
 
 Example-
 https://medium.com/@andreaspoyias/design-patterns-a-quick-guide-to-bridge-pattern-9ebf6a77baed
 
 - This pattern says that do not directly implement the protocol onto a class(say A).
 Create a sepearte class- Implement a protocol therein, and reference that class in class A(or inject it via DI)
 */

/**
 Exercise-
 You are given an example of an inheritance hierarchy which results in Cartesian-product duplication.

 Please refactor this hierarchy, giving the base class Shape  an initializer that takes a Renderer  defined as

 protocol Renderer
 {
   var rendered: String { get }
 }
 as well as VectorRenderer and RasterRenderer.

 The expectation is that each constructed object's description  operates correctly, for example,

 Triangle(RasterRenderer()).description // returns "Drawing Triangle as pixels"
 */

protocol Renderer {
  var rendered: String { get }
}

class VectorRenderer: Renderer {
  var rendered: String {
    return "lines"
  }
}

class RasterRenderer: Renderer {
  var rendered: String {
    return "pixels"
  }
}

class Shape: CustomStringConvertible {
  var name: String
  var renderer: Renderer

  init(_ renderer: Renderer) {
    self.name = ""
    self.renderer = renderer
  }

  var description: String {
    return "Drawing \(name) as \(renderer.rendered)"
  }
}

class Triangle: Shape {
  override init(_ renderer: Renderer) {
    super.init(renderer)
    name = "Triangle"
  }
}

class Square: Shape {
  override init(_ renderer: Renderer) {
    super.init(renderer)
    name = "Square"
  }
}

// imagine e.g. VectorTriangle/RasterTriangle etc. here
