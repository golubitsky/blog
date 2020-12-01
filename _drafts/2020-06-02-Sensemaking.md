---
tags: programming design bill-evans music
---

> A program is a frozen representation of an idea, a snapshot of a structure that once existed in a programmer's imagination.

--Tom Stuart, _Understanding Computation (Chapter 2)_

I've worked in some unfortunate codebases. I've worked on a genius programmer's incomprehensible wall of one-word variables. I've worked on consolidating multiple copied-and-pasted versions of the implementation of the same algorithm -- the several versions had, over time, inevitably drifted out of equivalence. I've worked on blindly upgrading mathematical libraries in a statistics-heavy codebase that was insufficiently-tested and had accreted over twenty years of so-called "organic" growth; did I mention it powered the entire company? I now work in an event-driven, microservices architecture. In this context we are slowly bringing our app to life -- to production -- via sustained, rigorous refactorings and increasing test coverage at unit, service, and app levels.

## Knowledge Workers

> Programs must be written for people to read, and only incidentally for machines to execute.

--Abelson, Sussman, and Sussman, _Structure and Implementation of Computer Programs (Preface)_

Programmers are knowledge workers. Our job is to process information from multiple (likely chaotic) streams and subsequently to output well-ordered information into other streams -- whether in the form of programs, documents, or communications. We are here to identify patterns and ultimately to _make sense_ of the chaos. We refine our understanding of what needs to be built until we are able to express it succinctly. 

Our most crucial objective is to understand what we're solving for. Once we understand the problem, programming is the easy part. We have all experienced this when working on toy problems, or even during interviews.  It turns out that if we can't express what our code should do in English (or whichever native language) it's highly unlikely that our code will make any sense at all. It doesn't matter which programming paradigm we pick, which principles we follow, whether we use tabs or spaces -- it doesn't matter how genius of programmers we are, _we'll never write code that others can understand_. Oh, and it turns out that part's pretty important, too! 

As it turns out, I have an incredibly low tolerance for things that don't make sense. During one of the above projects, a manager's manager walked in on a Friday afternoon and said "oh, just do x, and it will solve y" and promptly ran away. I did "x", which not only did not solve "y", but broke other existing tests "z".
