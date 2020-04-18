---
tags: programming design bill-evans music
---

> Every block of stone has a statue inside it and it is the task of the sculptor to discover it.

--Michelangelo

I've been working on as much of a labor of love as can be found at a programming job: something that will make real users' lives better. Bonus: I'd be such a user. In short, our current deployment process could use some automation. As often happens once (what in retrospect turns out to be) a critical mass of component pieces of knowledge are acquired, a solution begins to present itself. Such a breakthrough occurred over the last couple of days: inspired by the intuition that the pieces really could be put together, I worked until 10pm on a Friday night and then spent another 4 hours on Saturday morning tweaking my creation -- as I say, a labor of love. I want to share what I've been thinking about recently, and how these ideas resurfaced during this work.

## Abstractions

It's been said that one of the hardest parts of programming (along with naming and cache invalidation) is choosing the right abstractions. The abstractions we pick are crucial to our ability to reason about a program. Generalizing too much, too little, or across concepts that don't really belong together -- such missteps will eventually compound the cognitive load of working with the program. The ultimate test for abstractions is whether or not they help us to make sense of the complexity inherent to the domain.

We cannot expect to have started with the correct abstractions. During implementation we are bound to encounter inconsistencies between our original design (or operating model) and the reality of the domain that we come to understand in increasing detail. Such inconsistencies must be incorporated into our model if they decrease the cognitive load of working with the program -- through generous and unflinching refactorings.

## Every Block of Stone

I've thought of the Michelangelo quote while sitting at the piano. If I listen intently enough, I'll hear some ideas, some sounds. They may be echoes in my mind of music I'd been listening to (most recently, the title track of one of Bill Evans' last recordings, _We Will Meet Again_); wherever they may come from, some ideas are clear; most are faint. The fainter, the less-defined an idea, the more effort it takes to discover it.

Perhaps it is something like seeing an object right in front of you and describing its features. Instead, imagine seeing another object (of similar size) on the horizon, on a hazy afternoon, with the sun in your eyes. You might have to squint, or even travel a fair distance, to have any chance at accurately describing this second object. One thing is for sure: I've never heard an idea "in all its glory" to begin with. To arrive at such a sound -- one that does indeed feel glorious and even "complete" -- I will have had to have struggled.

In programming, too, the process of discovering the "right" abstractions proceeds in this fashion, from mostly-unknown, through not-exactly-known, towards well-understood, using what knowledge we might have in that moment. I put "right" in quotes because -- well, it doesn't exactly make sense to think that there is one "right" set of abstractions that will yield a program of lowest cognitive load, yet most malleable. Does it?

## Reference Dynamic Level

It's possible that there _is_ something objective about this "right" set of abstractions.

I recall one of the ideas of Dr. William Moylan, ony of my excellent college professors. In his book _Understanding and Crafting the Mix: The Art of Recording_, he introduces the so-called _reference dynamic level_, present in any given music recording. "Dynamic" here refers to "soft" and "loud." He describes the _reference_ dynamic level as "the overall, conceptual dynamic level of the piece of music;" "even a 90-minute symphony will have only a single RDL." In my memory, he called it "the level at which the music 'lives'."

To paraphrase, it's sort of the "weighted average" of all the loudness levels of every single instrument in the recording, across the entire duration of the music... but a little bit more. "It's very zen," we liked to joke. Dr. Moylan taught us that, to our surprise, the RDL is objective: "the listener will recognize when they have identified the correct level. The level will cause all other dynamic relationships to be understood, to make sense."

It's possible that the "right" set of abstractions is similarly something that critical programmers will eventually agree on, within a similar confidence interval that centers on "the reality of the domain" being modeled.

## Too much abstraction?

I recently watched an interview given by Roger Penrose during which he was asked "is mathematics discovered or invented?" During his far-ranging answer, one point he made was that the difference between the contributions of Newton and Einstein is one of precision. Penrose said that Newton described the situation to 7 units of precision; Einstein did to 14 units.

In science, too, there is a continual process of clarification towards the most unified, all-encompassing, concise, "abstract" theory.

That being said, while Einstein's theories are more precise and more broadly-applicable, they are, however, much harder for the layperson to grok than Newton's, which are taught in high-school.

In programming there is the notion of "perfect is the enemy of good." Thus it can be with abstractions -- most situations don't call for a Grand Unified Abstraction -- and in fact writing such code might increase the cognitive load of working with the program beyond the optimal level.

## The "right" abstractions

Arriving at the "right" abstractions would yield a program that:

- directly expresses the domain
- solves a problem in the domain (probably why we needed a program to begin with!)
- minimizes the technical complexity (aka "technical debt") introduced by the program itself (we didn't want a program just for fun, right?)
  - technical complexity is distinct from the complexity inherent to the domain

Most of all, such abstractions will "feel" right. Once you arrive at them, you will "feel" the clarity of the domain to have been expressed. Something like "of course it should be like this, why didn't I think of that sooner?"

There is indeed something "zen" about this formulation. Something very much like cutting away all the extra bits of stone.

It is not easy to write such a program, nor to play as Bill Evans did.
