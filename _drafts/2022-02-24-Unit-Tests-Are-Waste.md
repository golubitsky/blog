---
tags: TDD
---

TODO

- https://rbcs-us.com/documents/Why-Most-Unit-Testing-is-Waste.pdf

> Unit tests provided the drivers to take methods through
> their paces. Mocks provided the context of the environmental
> state and of the other methods on which the method under test
> depended. And test environments came with facilities to poise
> each object in the right state in preparation for the test.

> If you find your testers splitting up functions to support
> the testing process, you’re destroying your system
> architecture and code comprehension along with it. Test at
> a coarser level of granularity.

Both of the above seem to suggest unnecessarily small methods and treating a "method" or even "class" as the unit (instead: behavior is the unit).

> I define 100% coverage as having examined all possible
> combinations of all possible paths through all methods of a
> class, having reproduced every possible configuration of data
> bits accessible to those methods, at every machine language
> instruction along the paths of execution. Anything else is a
> heuristic about which absolutely no formal claim of correctness
> can be made.

> If your coders have more lines of unit tests than of code, it
> probably means one of several things. They may be paranoid
> about correctness; paranoia drives out the clear thinking and
> innovation that bode for high quality. They may be lacking in
> analytical mental tools or in a discipline of thinking, and they
> want the machine to do their thinking for them.

> In most businesses, the only tests that have business value are
> those that are derived from business requirements. Most unit
> tests are derived from programmers' fantasies about how the
> function should work: their hopes, stereotypes, or sometimes
> wishes about how things should go

> it’s better to make this an assertion than to pepper your test
> framework with such checks. More on that below.

> If you want to reduce your test mass, the number one
> thing you should do is look at the tests that have never
> failed in a year and consider throwing them away. They are
> producing no information for you — or at least very little
> information. The value of the information they produce may
> not be worth the expense of maintaining and running the
> tests. This is the first set of tests to throw away — whether
> they are unit tests, integration tests, or system tests.

- https://rbcs-us.com/documents/Segue.pdf
