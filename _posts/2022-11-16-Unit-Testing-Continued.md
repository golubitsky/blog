---
title: Unit testing (continued)
tags: tdd testing programming dave-farley rich-hickey
---

On unit testing. I see three broad paths:

1. No tests — terrible, don't even know where to start.
2. Tests of low-level details (like tests of "2 + 2 = 4", when the software is about "account balances") — not terrible, but very hard to work with, hard to refactor the code, hard to improve structure of the code; need to update tests when refactoring.
3. Tests of public-facing behavior — Goldilocks — perfection — can improve the structure of the code, limited only by my imagination, guided and reassured by the tests. The tests either pass or fail, _but need never be changed_.

### Improving legacy code is easier with tests of public-facing behavior

When I'm refactoring legacy code and I'm not sure about the eventual design, I aim to write tests for the outermost behavior that I _am_ sure about. Then, I can freely refactor inside of that unit. As Dave Farley wrote: "do not 'retrofit' TDD-style unit tests to legacy code."

I'm similarly wary to extract any ol' low-level abstraction and write tests for _that_ code (though sometimes that's the only way forward). I don't want to couple the tests to _that_ abstraction. Chances are, any abstraction I come up with on the first pass will not be the "right" one. My Nirvana is the ability to freely refactor code in complete safety guaranteed by the test harness that covers all the required behavior. (If unsure, I comment a line of code to check that it causes a sensible test failure) And if I find myself in a situation where I wanna refactor some low-level code that happens to have tests — but those tests are coupled to what I have gauged to be the "wrong" abstraction, I ask myself first of all "is this behavior already covered at a higher level?" If yes, delete the tests! And then I am temporarily in Nirvana — I can simply think and do and improve, without impedance, with safety. If it's not, I figure out how to port those tests to cover the higher-level behavior. Sometimes I do forensic work to figure out what the higher-level English-language spec _would_ have been, had it been written that way from the start.

These kind of "outside-in" tests are "broader" — that is, when they fail, it's harder to know why they are failing. You have to know more of the underlying code. But I prefer to simply make smaller steps while refactoring — to avoid causing any failures to begin with — if that means I can freely refactor the code. That's Nirvana to me. And ultimately, I wanna end up with "good abstractions" anyway. Then it's even easier to understand the root cause of any test failure — the code is simple.

What is Nirvana? You gotta be able to easily and confidently change the code. If you got no tests, you can't do that. If you have tests coupled to the wrong abstractions, you're also probably not gonna do it — it will be too expensive to change those abstractions and you'll think twice about doing it. But if your tests are only coupled to the outermost behavior — think, do, improve. Immediate feedback. Nirvana.

I don't have a silver bullet to fix all the problems (of course with a complex enough piece of software, we can't maintain _all_ the tests at the outermost level of behavior; or at least it will be harder — but hopefully at that point we think hard about what would be a stable abstraction and couple our tests to _that_ abstraction — this is what TDD is all about, by the way), but this is my thinking on writing tests and working with legacy code. Of which there is an endless amount. Because who wants to think about optimal design when you can just ship ship ship and then find another job before you have to face any of the mess you made?
