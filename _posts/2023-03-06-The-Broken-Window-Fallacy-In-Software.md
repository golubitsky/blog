---
tags: programming
---

In software, we are familiar with a so-called "broken window theory", where leaving behind bad code (the "broken window") increases the likelihood of the surrounding code being allowed to be left in an equally bad state ("the window's broken, anyway, so why bother?") — until eventually the entire house is rotting.

But over the weekend, I was reading from Henry Hazlitt's _Economics in One Lesson: The Shortest and Surest Way to Understand Basic Economics_ (1988, originally published in 1946) about the "broken window fallacy" famous in economics.

That one goes like this: it is a fallacy that when a thief breaks a window of a store, he spurs valuable economic activity — look at the window repair person who has new business, as well as at the producer of air conditioners that will now sell another air conditioner to the window repair person.

But what about the shopkeeper? At the end of that day, the shopkeeper functionally has the same window he had in the morning — and, crucially, not _also_ the new suit he had been saving up for. And what about the taylor who got no business from the shopkeeper who now had to spend his suit money on replacing the window? And on and on.

In short, notwithstanding any local positive effects, the community _at large_ is simply one window worse off.

Hazlitt summarizes this idea in a broader context. It is a fallacy to state that after World War II, the Germans and Japanese were somehow "better off" because their older factories had gotten destroyed, and now they could simply build shiny, new, efficient ones:

> it is never an advantage to have one's plants destroyed by shells or bombs unless those plants have already become valueless or acquired a negative value by depreciation or obsolescence

and finally —

> the wanton destruction of anything of real value is always a net loss, a misfortune, or a disaster, and whatever the offsetting considerations in a particular instance, can never be, on net balance, a boon or a blessing.

So much for the broken window fallacy.

## Two ways of working

Here are two ways to develop software:

1. You don't know your software well enough to know which parts of it are depended on by your users. When you make changes to public behavior, you either risk breaking your consumers, or, in the best case, ask your consumers how they use your public API.
2. You write unit tests that cover all the behavior that your consumers expect of your software. When you change that behavior, your unit tests alert you, and at that point you can either simply back out the changes, or — if you are indeed motivated to make such a change — reason about who is affected, and how. You also have such production monitoring that you know exactly what parts of your API surface have been used in the last 3 months, and maybe even by which group.

## Our way of working

As a consumer of another team's API surface, our team was contacted by a business analyst representing the producer of that API with an urgent, not-entirely-descript request that "something about the producer's API implementation was urgently being changed to satisfy a new client, and would your team please test everything on your end in QA, within the next business day, and reply if 'everything is good' or not."

Now, as one might imagine, the existence of such a request is in the first place a sign of how functional the lower environments are — so, as it turns out, our team was not able to find enough natural traffic in QA to satisfy these nondescript change requirements — there are too many _other_ issues in that environment.

After some discussion with the BA, it turned out that all that is needed is a formulation of how exactly our team uses the producing team's API. At this point I venture the simple suggestion — can't the producing team just have unit tests to alert them that they are breaking a previously-agreed-upon obligation to provide some behavior to their consumers? I argue that they can, and should.

So where is the "broken window" in the "broken window fallacy" here? It's the longstanding lack of that kind of upfront effort and investment in the inexpensive maintenance of the software. It's all the decisions made that led this software group up to the point where a producer does not know the answer to a simple question — "does this change affect my consumers?" (and, spoiler alert, the answer is "yes", yes it does, and needs to be backed out).

As a thought experiment, I posed that question to myself and to a team member — I asked us to imagine sending such a request to _our_ consumers — that is, "we're changing something very urgently — what, we can't even articulate to you — but can you please retest all your flows to make sure you're not broken?" — and I argued that I could not imagine asking such a question of our consumers. I argued that it would be unprofessional and unacceptable for our team to maintain software in such a way that required us to ask this question in this form.

## All I have is a window and this blog post

I could have spent the several hours I spent on this topic on making technical improvements that _our_ team needs — and, boy do we need 'em across the board. We ourselves live with a subsystem that we don't fully understand and cannot even fully monitor at the level of _what is it doing?_. But instead, I spent it "fixing the broken window" — fruitlessly looking for test data in a half-functioning QA environment and ultimately working with the other team's BA to help define requirements for them. But that is clearly a support task. And my time _could_ have been spent on more valuable things, rather than helping this team not break the system more. But it was not.

The window had been broken, and needed fixing. And I didn't buy that new suit I had been saving up for.
