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

