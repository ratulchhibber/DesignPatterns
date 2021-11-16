/**
 Factory Method and Abstract Factory
 
 1. This Creational design pattern is used when object creation logic becomes too convoluted.
 
 2. Object creation(non-piece wise, unlike Builder) can be outsourced to -
 2.a. A separate function (Factory method)
 2.b. That may exist in a separate class (Factory)
 2.c. Can create hierarchy of factories with Abstract Factory
 
 3. Factories allow you to have a better naming (You aren't restricted to using init for initialization of an object)
 
 4. A factory can be external or reside inside the object as an inner class.
 */

/**
Exercise- You are given a class called Person . The person has two fields: id , and name .

 Please implement a non-static PersonFactory that has a createPerson()  method that takes a person's name.

 The id  of the person should be set as a 0-based index of the object created. So, the first person the factory makes should have id=0, second id=1 and so on.
 */

import Foundation

class Person {
    var id: Int
    var name: String

    init(called name: String, withId id: Int) {
        self.name = name
        self.id = id
    }
}

class PersonFactory {
    private var idSequence: Int

    init(latestID: Int = 0) {
        idSequence = latestID
    }

    func createPerson(name: String) -> Person {
        let person = Person.init(called: name, withId:idSequence)
        idSequence += 1

        return person
    }
}
