---
title: "Programmer Tests: Behaviors"
tags: tdd testing programming
---

Much has been said about the distinction between "unit" and "integration" tests. Much has been said about what should be considered a "unit." Kent Beck refers to them simply as "programmer tests." Note that the words "class", "method", and even "module" appear _not once_ in his [Programmer Test Principles](https://medium.com/@kentbeck_7670/programmer-test-principles-d01c064d7934) post. So much for the prescription to "write a test before you write a method."

Most of the principles are about performance (cheap to write, read, change, run) and correctness (run reliably, predict deployability), but here I will focus on just the following two:

Programmer tests should

- Respond to behavior changes.
- Not respond to structure changes.

The focus is not on the "size of the unit"; it is rather on testing the behavior of a program, without exposing its implementation details.

## To mock or not to mock?

In this light, conceivable reasons to use mock implementations in tests:

- when required, to mock at the architectural boundary, e.g. read/write to a filesystem or database (though, these do not necessarily need to be mocked), HTTP call, or message publication
- for performance ("Minimize programmer waiting.") at the expense of completeness and/or future correctness (partially discussed in an [earlier post]({{ "/2021/07/13/Programmer-Tests-In-Messaging-Systems" | relative_url }})) and cost of change.

My journey into testing and TDD began as a mockist (AKA of the "London" school, detailed in the excellent _Growing Object-Oriented Software, Guided by Tests_, by Steve Freeman and Nat Pryce), and only later, after meeting Uncle Bob, did I start to gravitate to the classicist school. During that brief meeting, Uncle Bob explained to me the difference between the two schools, as I wrote [at the end of this earlier post]({{ "2019/03/14/Meetup-Uncle-Bob" | relative_url }})).

Over the last couple of years, as I've written more and more tests of _behaviors_, I've come to appreciate the power of such "black box" tests, which expose nothing about the implementation to the tests — they allow us to make sweeping refactors of the internal structure of the code without having to change the tests.

### Looking ahead

I recently watched [Sandro Mancuso - Does TDD Really Lead to Good Design?](https://www.youtube.com/watch?v=KyFVA4Spcgg). He describes a more nuanced decision process w.r.t. the question "to mock or not to mock?" He suggests to combine the classicist and London schools according to the design requirements — avoid mocks when the association of modules under test is characterized as a "composition" (i.e. each submodule is an implementation detail, though perhaps a larger one that is cleaner to extract) and use mocks when the association is characterized as an "aggregation" (i.e. each submodule represents a distinct behavior).

My current takeaway: mocking still seems less applicable in smaller services, as I described above. And most of what I work on these days is smaller services. In a larger system, however, it's possible that mocking can be used according to the ideas in this talk.

But for now, I don't see any reason to change my general approach to mocking only at the architectural boundary.

Another way to phrase Mancuso's idea: it's possible that in larger systems it makes sense to consider certain submodules to be architecturally bounded.

## My current approach to programmer tests

If I'm implementing a new feature, I start with the test of the behavior that I need. If that is too big of a slice of functionality I will end up writing intermediate tests of smaller chunks of behavior that will compose the overall behavior. If I can sense ahead of time that most of the complexity and edge cases will be in a particular submodule, I might first write tests of the behavior of that submodule in isolation. Then I will come back to the outermost behavior and write tests of the complete behavior — without mocking the aforementioned submodule.

To summarize, then, my overall strategy for writing programmer tests:

- Write tests of the outermost expected behavior.
- On an as-needed basis, only if there are many edge cases, i.e. a particular submodule contains a lot of special case logic:
  - Write tests for that submodule in isolation, to comprehensively cover its expected behavior (presumably some complex, mission-critical business logic).
  - Continue to cover only the basic straight-through paths at the outer level, to sanity check the entire path through the system.

I don't mind if there is slight "duplication" between the outermost tests and the comprehensive tests of the inner module.

I do not think that we need to automatically write tests just because we're adding a method or even a whole new file. That entire file can be just an implementation detail, so long as all the expected behavior is covered by tests.

I do not think that we need to mock for performance _to begin with_. If the run time of the programmer tests grows too much, we can always optimize the tests for performance at that point.

My favorite part about writing software is writing beautiful code. The only way to consistently live with beautiful code is to consistently refactor. This approach to testing is my best strategy to achieve that.
