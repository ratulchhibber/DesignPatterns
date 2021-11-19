/**
 This Structural Design Pattern- Adds behavior without altering the class itself.
 
 1. This is used when we want to augment an object with additional functionality.
 
 2. Do not want to rewrite or alter existing code (OCP).
 
 3. Want to keep new functionality separate (SRP).
 
 4. Need to be able to interact with existing structures.
 
To achieve the aforesaid-
 a. We could either inherit required object(if possible)- But some objects are final.
 
 b. Build a decorator, which simply references the decorated objects.
 ---
 
 Two ways we can implement this pattern-
 
 1. Dynamic decorator composition
 2. Static decorator composition
 
 */

// 1. Dynamic decorator composition
//Can put layers one on top of another - Thereby, giving them additional functionality.
import Foundation
import CoreGraphics

protocol Shape : CustomStringConvertible
{
  var description: String { get }
}

struct Circle: Shape {
    let radius: Int
    var description: String {  "A circle of radius \(radius)" }
}

struct ColoredShape: Shape {
    let shape: Shape
    let color: String
    
    var description: String { "\(shape.description) with \(color) color!" }
}

func main()
{
  // dynamic
  let circle = Circle(radius: 10)
  let coloredCircle = ColoredShape(shape: circle, color: "yellow")
  print(coloredCircle)
}

// 2. Static decorator composition
//Read Specification pattern- https://medium.com/swift2go/mastering-generics-with-protocols-the-specification-pattern-5e2e303af4ca

main()
