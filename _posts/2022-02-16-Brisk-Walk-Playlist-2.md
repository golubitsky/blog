---
title: Brisk Walk Playlist no. 2; Principles
tags: music bill-evans exercise refactoring design principles TDD
---

Last couple days I've been listening to

- [The Ride of the Valkyries by Wagner](https://www.youtube.com/watch?v=OlQ6P6MxZ0k); actually I'm only just now listening to it! The other day I was on my brisk walk without headphones, and there was a veritable armada of migrating birds above, turning around right above me — the entire flock was arranged in natural perfection of "V"s of various size and number, where somehow each member in a "V" knows exactly where to fly in order to maintain the "V" — and from that moment I was humming Wagner (no doubt in an echo of _Apocalypse Now_)
- Bill Evans's album _Interplay_ ([title track](https://www.youtube.com/watch?v=wFrJxNICfcg)), produced by [Orrin Keepnews](https://en.wikipedia.org/wiki/Orrin_Keepnews), to whom I learned "Re: Person I Knew" is dedicated to, in the form of the title that is an anagram of the producer's first and last names; I'm looking forward to reading some of Keepnews's writing
- Coltrane's _A Love Supreme_

A funny thing happened also — I heard a group play the standard _Don't Get Around Much Anymore_ in a sort of... "standard" ... way. And my impression of that was: this isn't _it_ — this isn't cutting edge in the right way that jazz is supposed to be. As counterpoint I note my feeling, today, on hearing McCoy Tyner's album _Fly With The Wind_ — I don't know why I reached for it exactly — it has mountains on the cover? — when he died last year or the year before, I had felt it as a loss — of something profound that was there at one point, and then was not — like Bill Evans, as prolific as he was, he produced virtually no output where he didn't play on the acoustic piano — I find that inspiring — no "special effects" of any sort, just monumental statements on the piano — but in any case, the orchestration on this album — drums, strings, flute, grand piano, bass — the driving rhythm — the "outness" — and yet somehow the unified, cohesive experience of the sound — _here_ was Jazz! That's how I felt it anyway. In particular, [McCoy Tyner - Salvadore De Samba](https://www.youtube.com/watch?v=0vBiWKIyseY) just blows my mind.

## Principles

I enjoy the _notion_ of principles. The definition of principle that I found:

> a fundamental truth or proposition that serves as the foundation for a system of belief or behavior or for a chain of reasoning

One set of principles I am inspired by is [Kent Beck's Programmer Test Principles](https://medium.com/@kentbeck_7670/programmer-test-principles-d01c064d7934), which I wrote about in an [earlier post]({{ "2021/08/10/Programmer-Tests-Behaviors" | relative_url }})).

At the end of that listing of principles, Beck wrote:

> That’s a difficult set of constraints to resolve. Some of them are contradictory. Figuring out which are more important and how best to satisfy the most important — that’s your job.

It seems Beck is suggesting that principles almost cannot stand _on their own_ — they define the abstract desired characteristics of an endeavor — and their reconciliation is what occurs during the creative act. I just think that's such a beautiful concept. I wonder if music can be approached with principles.

I also like [Martin Fowler's formulation](https://martinfowler.com/bliki/BeckDesignRules.html) of another of Kent Beck's set of principles, about design, in descending priority (parentheticals are mine, and express my understanding):

1. Passes the tests (correct)
2. Reveals intention (domain-centric)
3. No duplication (DRY)
4. Fewest elements (simple)

It would be interesting to also compare some of Rich Hickey's design principles. I suspect that #4 would be higher in priority.

In the book _Agile Development Principles_ Robert Martin enumerates three functions of good software:

1. Correctly perform its intended function
2. Afford change
3. Communicate to its readers

## A potential refactoring principle

This seems like something _approaching_ a principle to me:

> If code requires a lot of effort to be understood, expend the effort, and then immediately express that understanding as a refactoring of the code, so that this effort need never be repeated.

I think it could be refined — for example, what does "a lot of effort" mean, and how to measure it?

## In defence of principles

I disagree with Dan North's argument against principles-as-such in his recent blog [CUPID—for joyful coding](https://dannorth.net/2022/02/10/cupid-for-joyful-coding/):

> I soon realised that the idea of principles itself was problematic. Principles are like rules: you are either compliant or you are not. This gives rise to “bounded sets” of rule-followers and rule-enforcers rather than “centred sets” of people with shared values.

I don't see anything in the definition of "principle" (above) that requires compliance. Principles are already about achieving and expressing shared values.

Dan North proposed to think, instead of principles, about "properties" — as "qualities or characteristics of code rather than rules to follow"; "Properties define a goal or centre to move towards. Your code is only closer to or further from the centre, and there is always a clear direction of travel." I just don't see how that is different from what the dictionary definition literally says (above). Principles are an expression of abstract ideals. I find the notion of using the term "property" instead of "principle" based on the above argument pretty superfluous. I have nothing against the term "property" but why do we need to throw away the term "principle" to talk about properties? I don't see it. As Kent Beck suggested (quoted above), it's our job to reconcile perhaps-at-times-conflicting principles/constraints. The path is made clear as we decide which tradeoffs to make.

Additionally (and separately): perhaps the term BDD helped guide some people who had of their own accord strayed from the original definition of TDD, but the term "TDD" itself seems to have always been about behavior _to begin with_, as Ian Cooper pointed out in perusing Beck’s original formulation of TDD ([source: DevTernity 2017: Ian Cooper - TDD, Where Did It All Go Wrong (23:52)](https://www.youtube.com/watch?v=EZ05e7EMOLM&t=1432s)).

To [quote Robert Martin](https://blog.cleancoder.com/uncle-bob/2020/10/18/Solid-Relevance.html):

> Every new generation likes to think that their world is vastly different from the generation before. Every new generation is wrong about that; which is something that every new generation learns once the next new generation comes along to tell them how much everything has changed. <grin>

## A principle of principles

Okay, this is getting too abstract, but that's why it's at the end of the post.

A principle that makes sense to me: "as a framework to solving some problem or building some solution, we _could_ define the abstract principles that define the fundamental/abstract goals of our endeavor, and then optimize for the implementation of the maximum amount of these goals". It simply strikes me as a professional approach to an optimization problem.
