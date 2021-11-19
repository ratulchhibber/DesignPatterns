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

/*
 Exercise-
  The following code scenario shows a 'Dragon' which is both a 'Bird' and a 'Lizard'.
  Complete the Dragon's interface (there's no need to extract protocols out of either
  'Bird' or 'Lizard'). Take special care when implementing the 'age' property!
 */

class Bird {
    var age = 0

    func fly() -> String {
        return (age < 10) ? "flying" : "too old"
    }
}

class Lizard {
    var age = 0

    func crawl() -> String {
        return (age > 1) ? "crawling" : "too young"
    }
}

// Solution
class Dragon {
    private let bird = Bird()
    private let lizard = Lizard()

    var age: Int {
        set {
            bird.age = newValue
            lizard.age = newValue
        }
        get {
            return age
        }
    }

    func fly() -> String {
        return bird.fly()
    }

    func crawl() -> String {
        return lizard.crawl()
    }
}
