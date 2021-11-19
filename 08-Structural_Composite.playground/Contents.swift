/*
 This structural design pattern-
 
 1. Treats individual and aggregate objects uniformly.
 https://levelup.gitconnected.com/composite-pattern-in-swift-8c7b932fc157
 
 When should we use this pattern?
 
 2. To compose multiple objects through a unified interface.
 This pattern should be used when we have a collection of objects that we treat uniformly. The client does not know the types of objects it deals with and it implies that all objects should conform to the same interface. It makes the client code simple because the types of objects become transparent to the client.
 
3. To treat a composition of objects as one.
 This pattern should be used when we have a collection of objects with hierarchical relationships. The collection of objects forms a tree like structure with a hierarchy. The structure contains leaves (individual objects) and composites (composition of objects).
 
 4. To decouple objects knowledge from the client.
 This pattern should be used when the client is aware of the types of objects it uses. By sharing an interface, objects do not need to be treated individually and it removes complexity from the application. The client does not need to check if it calls the right method on the right object: it calls the same method over an entire structure of objects. The ‘Composite’ pattern collects and manages objects for the client, which can work with any objects from the structure without any coupling.
 */

/*
 Composite Coding Exercise
 Consider the code presented below. The sum()  extension method adds up all the values in a list of Sequence -conforming elements it gets passed. We can have a single value or a set of values, all of them get added up together.

 Please complete the implementation of the extension so that sum()  begins to work correctly.

 Here is an example of how the extension method might be used:

 let singleValue = SingleValue(1)
 let manyValues = ManyValues()
 manyValues.add(2)
 manyValues.add(3)
 let s = [AnySequence(singleValue), AnySequence(manyValues)].sum() // s = 6
  */

import Foundation

class SingleValue : Sequence
{
  var value = 0

  init() {}
  init(_ value: Int)
  {
    self.value = value
  }

  func makeIterator() -> IndexingIterator<Array<Int>>
  {
    return IndexingIterator(_elements: [value])
  }
}

class ManyValues : Sequence
{
  var values = [Int]()

  func makeIterator() -> IndexingIterator<Array<Int>>
  {
    return IndexingIterator(_elements: values)
  }

  func add(_ value: Int)
  {
    values.append(value)
  }
}

//Was todo
extension Sequence where Iterator.Element: Sequence, Iterator.Element.Iterator.Element == Int {
    func sum() -> Int {
        var result: Int = 0

        for element in self {
            for value in element {
                result += value
            }
        }

        return result
    }
}
