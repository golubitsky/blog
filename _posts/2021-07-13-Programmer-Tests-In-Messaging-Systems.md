---
title: "Programmer Tests: In Messaging Systems"
tags: tdd testing programming
---

I work a lot with messaging systems. Messages are exchanged via pub/sub. This post is about integration testing for one such service that both subscribes to and publishes multiple kinds of messages.

This service receives messages (handled by module `W`) with instructions to create Widgets and messages (handled by module `G`) with instructions to create Grumpkins. Widgets and Grumpkins are stored in the service's dedicated database.

Additionally, the service periodically receives messages (handled by module `P`) with instructions to publish representations of all available Widgets and Grumpkins.

The question I address in this post: how to effectively test `P`?

## Objectives

- `P` should be completely tested
- behavioral changes to `W` and `G` should cause the tests of `P` to fail
- implementation details should not be exposed to the tests

## Approach to the problem

It is possible to test each of `W`, `G`, and `P` in isolation. This could be fine in the cases of both `W` and `G`, where the state on which they depend is expressed entirely in the messages they receive; however...

## How to setup the state required to test `P`?

In production, it is the responsibility of both `W` and `G` to setup the state required for `P`.

Consider that the behavior of either `W` or `G` is intentionally changed.

### Using additional test setup code?

If we had written additional code to setup the state, such tests of `P` would continue to pass, but the behavior under test would no longer be relevant to the system. Such tests will essentially depend on future developers to somehow know that if they change behavior of either `W` or `G`, even though such tests of `P` will _not_ fail, changes to `P`, and to those tests, are still required. This is undesirable.

### Using the production code of `W` and `G`

Therefore, I use the actual production code of both `W` and `G` to setup the state required to test `P`. That way, if the behavior of `W` and `G` changes, the tests for `P` _will_ (correctly) break.
