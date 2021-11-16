/**
 This Structural Pattern is a construct which adapts an existing interface X to conform to the required interface Y.
 
 -This pattern is used incase you wish to transform your data type from what is being received(say from an external system or by any other means)- To a data type which can be readily consumed by the system.
 */


/**
 Exercise-
 You are given a Rectangle  protocol and an extension method on it. Try to define a SquareToRectangleAdapter  that adapts the Square  to the Rectangle  protocol.
 */

class Square
{
  var side = 0

  init(side: Int)
  {
    self.side = side
  }
}

protocol Rectangle
{
  var width: Int { get }
  var height: Int { get }
}

extension Rectangle
{
  var area: Int
  {
    return self.width * self.height
  }
}

class SquareToRectangleAdapter : Rectangle
{
    private let square: Square
    
    var width: Int { return square.side }
    var height: Int { return square.side }
    
    init(_ square: Square) {
        self.square = square
    }
}
