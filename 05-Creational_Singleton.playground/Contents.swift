/**
 1. This Creational design pattern creates a single instance of a class.
 
 2. This should always be thought of prior to its usage- since, there is always a better way of doing things than creating a singleton.
 
 3. Incase, you encounter a codebase heavy on Singletons - Try extracting that functionality onto protocols and make the singleton conform to that protocol.
 
 4. There are some places where singleton is used - example Logging etc.
 
 In this case rather than using Logger.shared. throught your codebase - wrap it in a protocol function
 
 Example- protocol Logging {
 func log(message: String)
 }
 
 extension Logging {
 func log(message: String) {
 Logger.shared.logMessage() // This gets only used here- This can be refactored going forward.
  }
}
 
 Now conform all classes to Logging- It does not know it used a Singleton underneath- Read related Monotype Pattern.
 
 
 3. Drawbacks-
 
 3.a. Testability- Since, the instance being created cannot be mocked- It brings forth issues in testability
 
 3.b. Creates an object which lives throughout the lifecycle of an application - The created object does not get purged cleared up via reference counting mechanism.
 */

/**
 Challenge- Write a method called isSingleton() . This method takes a lambda (actually, a factory method) that returns an object and it's up to you to determine whether or not the object being returned is, in fact, a singleton.
 */


class SingletonTester
{
  static func isSingleton(factory: () -> AnyObject) -> Bool
  {
      return factory() === factory() // === -> Compares the memory address while == compares the value of the objects
  }
}


/**
Monotype pattern-
There may be cases where Singleton is used underneath a class - This may cause issues since, the consumer of the class does not know that a Singleton is being used underneath.
This, non-explicit use of Singleton is called Monotype pattern.
*/
