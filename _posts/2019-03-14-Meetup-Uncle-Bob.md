---
tags: meta
title: I Attended A Meetup At Which Uncle Bob Spoke
--- 

I attended a talk by Uncle Bob about the history of "Agile." In honor of Pi Day, he began the talk with a "Pi-off" -- he and a member of the audience recited digits together until one couldn't go on. The member of the audience won at about 105 digits.

He talked about the signing of the [Agile Manifesto](https://agilemanifesto.org/) -- how this was the outcome of a bunch of people who didn't agree with each other having sat in a room for a couple of days, and coming to agree on these points. No one could remember who wrote the words on a board (Martin Fowler? Ward Cunningham?) -- but Ward Cunningham published them on the internet ("sure, publish it, whatever.."). Subsequently the authors were surprised to find that tens of thousands of people had also added their signatures to this document. The original signers have never again all met together.

The name "agile" was not overly intentional. No one was particularly excited about it.

Uncle Bob talked about how he had met Kent Beck at a conference in 1995; how after 30+ years of programming he thought it unlikely to be introduced to a fundamentally different way of programming, but was happily surprised that Beck introduced him to test-driven development (TDD), which changed the way he built software. It's the only way to go fast, he says.

I'll share some of my notes from the talk.

## Agile At the Highest Level
* Agile is a set of practices and disciplines. It's not a so-called "mindset."
  * Divide all the work into little pieces.
  * Estimate how much time each piece will take. These will be wrong. They're _estimates_.
  * Plot on a wall (Velocity, Burndown).
  * Stakeholders choose what we work on.
* The purpose of Agile is to destroy hope. "We don't want hope, we want truth."

## The Process
* Good, Fast, Cheap, Done -- pick any 3.
* Management's job is to adjust the coefficients to drive the project to an acceptable outcome.
  * An acceptable outcome requires data, specifically: Velocity and Burndown Charts. Everyone should see them.
* Knobs for Managers
  * Schedule -- generally hard to change, but possible to convince some clients/stakeholders.
  * Staff -- risky. Increasing a project's headcount incurs immediate cost, but the hope is that eventually the new team members become valuable contributors.
  * Quality -- it's up to the programmer to say "no" to a manager who wants to touch this knob. Best not to touch it.
  * Scope -- This seems to be the only reasonable knob to adjust. Clients won't like removing features from the MVP, but they'll like getting something more than getting something very, very late.
* There's the notion of "flaccid scrum": https://martinfowler.com/bliki/FlaccidScrum.html.

## Time Estimates
* The purpose of a sprint is not to get things done, but to deliver data to management. A sprint cannot fail, even if no tickets are completed.
* Story points (he didn't refer to them as "story" points, just "points"), although meaningless, "have the wonderful benefit of being _right_." We don't have to know what they mean, just that they mean something relative to themselves.
* "Golden Story" -- the one ticket that is the anchor for story-pointing. "Login was 2 story points, so how could $$x$$ be a 5?"
* We generally don't get all the cards (tickets) done; but we come to know how much _can_ be done. This yields data.
* Control Theory: don't put pressure on something you're measuring (w.r.t. managers trying to push teams to get 5 more story points done next sprint -- "you can do it guys! It's a stretch goal!" -- this will lead to story point inflation).

## 3 Things We've Learned Over The Past 50 Years
* Don't use the GOTO statement.
* Don't use pointers to functions.
* Don't use assignment (we're still learning this!).

## Assorted
* The deadline is frozen. The requirements are always changing.
* Soft-ware: "flexible product." Requirements must change. We invented software so that we can easily change the behavior of our machines.
* TDD is not a process but a discipline.
* Definition of done: all the acceptance tests pass (acceptance tests are automated).
* Get good at it (anything) at home. Don't start at work. Pressures will be too great.
* Wait on details until the last minute -- don't form requirements early.
* **Structure the shape of the application such that architectural decisions can be delayed as far as possible.**
* Runaway Process Inflation: take the thing that didn't work and do more of it (in discussing the Waterfall Development Model).
* Speaking of Waterfall Development: Uncle Bob mentioned that the original paper that introduced it actually pointed out that this model doesn't work! But that this was all the way on page 4 or 5. Page 1 had a pretty chart. No one read the paper; but just copy and pasted the pretty chart.

## Recommended Reading
* Kent Beck's Extreme Programming Explained, specifically the 1st edition
* Anything written by [Mike Cohn](http://www.mountaingoatsoftware.com/books)
* Ken Schwaber's Agile Software Development with Scrum

## Personal Note
Before the talk, I had the pleasure to meet one of my software heroes. I told him that he is an inspiration to me, that I've often watched videos of his talks and gained confidence to do what I believe is right.

In the course of our conversation, he took the time to explain to me the difference between ["classicist" and "mockist" approaches to TDD](https://martinfowler.com/articles/mocksArentStubs.html#ClassicalAndMockistTesting). I had always been confused by this.

Let me explain. The method of TDD I had first learned and have since come to practice is based on a combination of
* a distillation, by an awesome lead engineer and past colleague, of what he had learned from Michael Feathers' Working Effectively With Legacy Code  
* later reading what Uncle Bob referred to as [the "Goos" book](http://www.growing-object-oriented-software.com/) as an amazing recapitulation of what I had previously learned and practiced.

So I asked Uncle Bob: "I'm a mockist. I understand how to test with mocks. But I don't understand how to test without mocks. I don't understand the classicist approach." And Uncle Bob said that while he very much respects the "Goos" book (I could see him light up as I mentioned it), he disagrees with the authors! He explained:

| Mockist | Classicist |
|:-:|:-:|
| Tests the algorithm | Tests the result (similar to testing a pure function) |
| More precise; harder to maintain tests | Fuzzier; easier to maintain tests |
| Tests are coupled to implementation | Tests are not coupled to implementation |

Most importantly, Uncle Bob cleared up what I was confused about w.r.t. the classicist school. He said that _at the architectural boundary_ (e.g. file system, database, user interface), yes, _of course_ the classicist would still mock. But the classicist would _not_ mock an object's collaborators that were within the architectural boundary. And I said I will try this approach on my next project! So it turns out that the classicist still does mock, sometimes. I shook his hand and said thank you.