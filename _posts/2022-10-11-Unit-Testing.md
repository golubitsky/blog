---
title: My unit testing strategy, and some other thoughts on software
tags: tdd testing programming
---

I work with what are ostensibly "micro" services. I prefer unit tests to test one entire path through the service — starting at the entrypoint (HTTP request, inbound message from queue) and ending either with the return value (HTTP response) or side effects (asserting database state and/or published messages). And I mock only at the architectural boundary (e.g., an HTTP request made by the system under test), only mocking inside the service in special cases (like for Time.now or something).

I only add tests of smaller units of behavior when the internal behavior is too complex to be comprehensively tested at the outer level. But the tests of the outermost behavior are _always_ the starting point.

These are the unit tests that give deployment confidence. The unit is behavior — not class, not method — classes and methods are implementation details.

## Some stray thoughts on software

### Limit WIP + clear communication

Large batch-size and/or large amounts of work in progress (two sides of the same coin) is one of the great enemies in software. Lack of clear communication is another.

I've never done technical mountain climbing, but my notion is that when you're on a rope together with someone, and you're in a risky situation, you make a series of small maneuvers. And you communicate about each of your maneuvers, lest your partner be caught off guard.

### Maintain only what is needed

Don't build functionality that isn't needed by the business. Delete code that doesn't serve the business. There's no universe in which it makes sense to keep code around that isn't directly needed by the business _today_. If you ever miss that code (spoiler: you won't), get it back via git history.

### Clean code comes from understanding

Make an effort to understand everything you’re doing and ask questions if you don’t. Communicate well. Do what you promised to do. Follow through.

Think very critically about the way you design a test. Think about what you're testing. Think about how to test it in the most direct, minimal way — in isolation — to truly prove the target behavior. You'll go a long way if you focus on designing the right tests — this will lead you to designing a system that Makes Sense.

Strive to write code that is self-consistent. First at the function-level, then at the module-level, then service-level. Think about [nature]({{ "/2022/07/18/About-complexity" | relative_url }}) — it is always self-consistent because it simply "obeys the laws of physics" or, even more simply, "is". That's the best kind of code. Usually human-made creations (including our code) aren't that way. We've done extremely well if we have written something that is self-consistent, like nature.

Reading good code improves one's understanding — not clouds it. Code should express your model of the domain — how you view the problem. If you're not writing clear-enough code, you haven't understood the problem or the domain well enough. Usually that means you have to ask more questions.

I'm very, very rarely positively amazed by any code. Sometimes I'm amazed when I see a pattern that I can immediately tell is cleaner than anything I had known before. I think I feel a little bit of amazement then. Code that's written by someone who knew just what should be left there, the bare minimum needed for it to work and still make perfect sense — basically, to borrow from Michelangelo, they found the sculpture inside the nondescript block of marble. I'm amazed when I see code that is truly consistent within itself — so rare in the real world. For some reason I think specifically of some open source code written by Mark Seemann that I had read years ago. I'm amazed when code doesn't force me to contort my thinking just to understand what it's trying to do.

But I think the same is true generally — few things are amazing. The whole point of amazement is that it is about something extra-ordinary. Most things are, rather, ordinary — and do not warrant amazement.
