---
tags: programming design
---

I was talking about spaghetti code with someone today. Where does it come from? In the idealized case, I write a program by myself, and I have understood the logic I need to implement — in English. And then I write the code that perfectly crystallizes my well-reasoned logic in a computer program written in a programming language. And so now a machine can also interpret my logic. So far so good!

Does that program make sense to the proverbial you? If it doesn't make sense to you, I have some work to do. It's spaghetti code until it makes sense to not only me, but also to you.

Now let's zoom past all these toy examples, to the real world! Woosh! Real software. How does Real Software get made? Via a distributed process. Distributed how? Across humans and across time. So now our simple problem of crystallizing well-reasoned logic into a computer program increases in complexity by at least one, if not by multiple orders of magnitude.

I believe that the well-intentioned programmer is capable of writing a perfectly well-reasoned and well-expressed program in isolation. (Even that is not trivial!) And but now we have to do this across multiple humans, over many years. Under continuous pressure from the business, which is under its own pressure from market forces.

That is how a perfectly well-reasoning programmer comes to encounter a situation in which it's quite intractable to make sense of the whole situation in the time alloted. And so they add directly to the spaghetti in a way that can get them out of there ASAP. Or, in a better case, they build a perfect little module "off to the side" — it's perfect and "bulletproof". But guess what? It solves the wrong problem. From the get-go. It's already agglomerating more spaghetti into the pile. That is the reality of a lot of software, in my estimation. In such situations it takes enormous amount of effort to unspaghettify the whole surrounding area — but that energy is not expended.

Spaghetti code doesn't spring forth from the womb as such — though there are some epic, "prolific" programmers who can spew forth spaghetti from the outset — it agglomerates over many, many changes across time and multiple humans — all understanding each other to various degrees.
