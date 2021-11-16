/**
 1. This Creational design pattern is used when it is easier to copy an existing object, than to fully initialize an exisiting one.
 
 2. Herein, an existing(partially or fully constructed) design is used as a protoype.
 
 3. We make a copy of the prototype and further customize it.
 - This requires deep copy support.
 
 4. We can clone via use of a Factory(this need not always be the case).
 
 5. dequeReusableCell of TableView is an example of this pattern
 
    a. If there is a cell in the reuse queue -> It will be dequed and returned ready for configuration.
 
    b. If there are no cells available - which would be the initial case -> It takes a copy of the prototype designed by you and returns it.
 */

class Point
{
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int)
    {
        self.x = x
        self.y = y
    }
}

class Line
{
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point)
    {
        self.start = start
        self.end = end
    }
    
    //Deep copy functionality
    func deepCopy() -> Line
    {
        let newStart = Point(x: start.x, y: start.y)
        let newEnd = Point(x: end.x, y: end.y)
        return Line(start: newStart, end: newEnd)
    }
    
    /**The aforesaid works since, x and y are of type Int
     Incase, they weren't of type struct - We could have done deep copy the following way-
     
     func deepCopy() -> Self {
     return cloningFunc()
     }
     
     private func cloningFunc<T>() -> T {
     return Line(start:start.deepCopy(), end: end.deepCopy()) as! T
     }
     **/
}


