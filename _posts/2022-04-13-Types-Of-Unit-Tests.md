---
title: Types of unit tests, and some other thoughts on TDD
tags: tdd testing programming dave-farley
---

I wish to collect some thoughts on test-driven development (TDD).

### To provide test coverage or not?

When you don't provide complete test coverage of all the behavior in your code, you're taking out technical debt — to be paid by the future team. You might work on a team where that is acceptable, but I prefer to work on a team where it is not.

In my opinion, on a team project, in a large application (i.e., essentially all enterprise software projects), any behavior that is not under test is technical debt and a liability.

I write tests because I don't wish to saddle the team (present or future) with technical debt. They should know that all of the behavior I've implemented continues to work so long as all the tests are passing.

### To write tests first or after?

I write tests first:

- to know when I'm done
- to commit only the code I need
- to not commit any code I don't need
- to refactor (i.e., to improve the structure and design of the program as my understanding of the domain or programming language improves)
- to safely change the behavior in the future
- so that any other programmer may enjoy the same benefits when working on this code in the future

Is it possible to achieve all of this without writing tests first? Sure it is. But you'd have to be an expert to continuously achieve the same results without writing tests first.

Are you an expert at keeping all the behavior under test and at not writing "just in case" code? I'm not; I use TDD to achieve these goals, and thereby to not saddle my team (present & future) with unwarranted technical debt.

### Three Types of Tests

David Farley provides a lucid, succinct [explanation of the 3 types of unit tests](https://www.youtube.com/watch?t=519&v=W40mpZP9xQQ&feature=youtu.be) (link is to a particular timestamp, but the whole video is excellent!).

My summary and commentary:

- In the simplest type of test, we assert the return value of a function under test.
- Raise the complexity, and now we assert the state, which has been modified via the side effects of calling the function under test.
- Raise the complexity again, and now we assert about how our function collaborates with other code. This is where we have to use mocks of some sort. A classicist ([a la Martin Fowler](https://martinfowler.com/articles/mocksArentStubs.html#SoShouldIBeAClassicistOrAMockist)) would say "only use mocks at the architectural boundary" ([earlier post]({{ "/2019/03/14/Meetup-Uncle-Bob" | relative_url }}), in which I wrote about how Robert Martin explained this to me) — e.g., to stub an HTTP request, or to capture what message was published.

Only increase the complexity when necessary. Also, note that 2 of 3 types are [black-box tests](https://en.wikipedia.org/wiki/Black-box_testing). Only the last, and most complex, type of test exposes implementation details to the test — and even then, minimally, and strategically.

### TDD, technical debt, and refactoring

Based on a lot of code that I've read, I think teams that don't practice TDD may simply end up _never_ refactoring; they may also not realize that they're missing an essential component of software development.

One measure of technical debt I've read (w.r.t. the expressivity of a codebase) is "the distance between a team's understanding of the domain and the code's expression of that understanding" (I wish I knew where I read this, as it's an excellent way to think of technical debt). Since our understanding is always improving, relentless refactoring is the only way to continuously prevent this technical debt from growing.

In his talk [TDD, Where Did It All Go Wrong](https://www.youtube.com/watch?v=EZ05e7EMOLM), Ian Cooper discusses about how during the green phase of TDD (more about "red/green/refactor": [James Shore](http://www.jamesshore.com/v2/blog/2005/red-green-refactor), [Robert Martin](https://blog.cleancoder.com/uncle-bob/2014/12/17/TheCyclesOfTDD.html)) we’re supposed to program like the “duct-tape programmer” — and that the real benefits come from the refactor phase of TDD.

### TDD vs testing, and acceptance tests

I feel like the essential difference is around the fact that developers write the tests in TDD — in order to write the production code to spec; whereas testers/QA are intentionally trying to find ways to break the software — in ways the developers may not have thought about.

On the other hand, there's no rule that says developers can't write tests in TDD that are akin to a QA tester's tests. Those TDD tests might even be informed by QA, and perhaps even by the users; at which point, the distinction between TDD and testing seems to blur even more.

Just the other day, I was working through some test cases with a BA — as we were discussing each test case, I would point to the dev ticket(s) that would implement that test case. Isn't that a form of TDD? In this case, the BA is a proxy for the users, and the test cases are the acceptance tests.
