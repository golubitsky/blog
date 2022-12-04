---
tags: programming design
---

Given the programs that I have read and written in my professional software career thus far, I am not convinced that the complexity of objects and classes as we know them is warranted as the default mechanism to achieve modularity. Most programs that operate on data should start out as collection of functions also known as modules. Classes should be introduced only when intermediate state management is necessary and leads to either a perceptible decrease in program complexity or measurably improves performance.

Writing classes by default, without a thought, often leads to incidental complexity, with no discernible benefit.

## Incidental complexity

### Classes with one public method

The simplest example is of a "class" with one public method. In this case, the ceremonious initialization and subsequent construction of the class are simply boilerplate and incidental complexity. The "class" could just as easily be a function.

### Instance variables are harmful

A more harmful example is that classes make it too easy to introduce incidental, unnecessary, intermediate state. The instance variables used in such classes can easily become a crutch to support a poor design. These unnecessary instance variables can introduce coupling across multiple pieces of that class for parts of the algorithm that should, in fact, live together — that is, they should have high cohesion. The state stored in those instance variables leads to code with "low cohesion and high coupling", when of course, what any good design requires is "high cohesion and low coupling" — that is, the elements of the program that "belong together" should be together in one module, and the unrelated (or less-related) elements should be in other modules; and all of these modules should be loosely coupled — that is, a change in one should not often necessitate a change in another. In most cases, a far simpler algorithm can be designed — one that would _not_ require the intermediate state stored in those instance variables. Needlessly introducing state into our programs increases program complexity.

### State shared across multiple classes is harmful

What is still more pernicious is when such instance variables (which are already a crutch to support poor design) are exposed via "attribute readers" (and _still_ worse, via "attribute writers"), thus exposing the internal state of that object to the outside world. And so now all of the above problems occur across multiple classes in multiple files. And this may be _the number one reason_ for how we end up with the proverbial Ball of Mud "design". As the project continues, the original introduction of coupling of multiple elements via the intermediate state requires more and more bandaids to maintain and reason about.

## Keep it simple

I am sure that it is possible to write clean, modular object-oriented code. But I believe that in practice, such code is the exception. I believe that we should use the simplest techniques available to write programs. Modules of functions are unambiguously simpler than classes. Before writing another class, let us pause and consider whether a class is truly warranted and decreases program complexity, or if a simple module of functions would do just as well.
