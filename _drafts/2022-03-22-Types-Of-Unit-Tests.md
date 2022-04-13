---
tags: tdd testing programming
---

### Three Types of Tests

David Farley provides a lucid, succinct [explanation of the 3 types of unit tests](https://www.youtube.com/watch?t=519&v=W40mpZP9xQQ&feature=youtu.be) (link is to a particular timestamp, but the whole video is excellent!).

My summary and commentary:

- In the simplest type of test, we assert the return value of a function under test.
- Raise the complexity, and now we assert the state, which has been modified via the side effects of calling the function under test.
- Raise the complexity again, and now we assert about how our function collaborates with other code. This is where we have to use mocks of some sort. A classicist ([a la Martin Fowler](https://martinfowler.com/articles/mocksArentStubs.html#SoShouldIBeAClassicistOrAMockist)) would say "only use mocks at the architectural boundary" ([earlier post]({{ "/2019/03/14/Meetup-Uncle-Bob" | relative_url }}), in which I wrote about how Robert Martin explained this to me) — e.g., to stub an HTTP request, or to capture what message was published.

Only increase the complexity when necessary. Also, note that 2 of 3 types are [black-box tests](https://en.wikipedia.org/wiki/Black-box_testing) (Wiki: https://lnkd.in/eREVSrzK). Only the last, and most complex, type of test exposes implementation details to the test — and even then, minimally, and strategically.

### TDD and technical debt

Based on a lot of code that I've read, I think teams that don't practice TDD may end up simply not doing point 3; they may also not realize that they're missing an essential component of software development.

One measure of technical debt I've read (w.r.t. the expressivity of a codebase) is "the distance between a team's understanding of the domain and the code's expression of that understanding." Since our understanding is always improving, relentless refactoring is the only way to continuously prevent this technical debt from growing.

### TDD vs testing

I feel like the essential difference would be around the fact that developers write the tests in TDD — in order to write the production code to spec; whereas testers/QA are intentionally trying to find ways to break the software — in ways the developers may not have thought about.

On the other hand, there's no rule that says developers can't write tests in TDD that are akin to a QA tester's tests. Those TDD tests might even be informed by QA, and perhaps even by the users. At which point the distinction between TDD and testing seems to blur even more.

Just the other day, I was working through some test cases with a BA — as we were discussing each test case, I would point to the dev ticket(s) that would implement that test case. Isn't that a form of TDD? In this case, the BA is a proxy for the users, and the test cases are the acceptance tests.
