/*
 This Structural design pattern is a space optimisation technique, that lets is use less memory by storing externally the data associated with similar objects.
 
 Goal is to save memory.
 
 1. This is used when we want to avoid redudancy when storing data. The flyweight pattern allows us to use one object in many places to avoid excessive memory use. Sometimes that object might contain all the information it needs to be used by itself, but other times it contains only the data that is fixed – individual users need to provide the missing data that makes them unique.

 Problems:
 1. Swift value types are always copy on write, which means you can duplicate them 100 times or 10,000 times without worrying about the performance implications.
 2. Even if they weren’t copy on write, most apps have hundreds of megabytes of RAM to work with at the absolute minimum, and the extra complexity to implement (and debug!) flyweight might cost you more than it saves.
 3. Sharing objects can easily lead to code that’s harder to debug and certainly harder to reason about.
 */

/*
 Exercise-
  You are given a class called 'Sentence', which takes a string such as "hello world".
  You need to provide an interface such that the subscript of the class returns a 'WordToken'
  which can be used to capitalize a particular word in the sentence.
 
  Typical use would be something like:
 
  1| var sentence = Sentence("hello world")
  2| sentence[1].capitalize = true
  3| print(sentence)
 */

import Foundation

class Sentence : CustomStringConvertible {
    private var text: [String]
    private var tokens = [Int: WordToken]()

    init(_ plainText: String) {
        self.text = plainText.components(separatedBy:" ")
    }

    subscript(index: Int) -> WordToken {
        get {
            let token = WordToken()
            tokens[index] = token
            return tokens[index]!
        }
    }

    var description: String {
        var words = [String]()

        for i in 0..<text.count {
            var word = text[i]

            if let item = tokens[i], item.capitalize == true {
                word = word.uppercased()
            }

            words.append(word)
        }

        return words.joined(separator:" ")
    }

    class WordToken {
        var capitalize: Bool = false
        
        init() {}

        init(capitalize: Bool) {
            self.capitalize = capitalize
        }
    }
}

 
 

