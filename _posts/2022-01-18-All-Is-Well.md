---
tags: programming monitoring jazz piano professionalism dataism philosophy
---

A fun post today! TL;DR: Man's purpose is beauty. Tools are useful. Thinking (still) helps. I think that's the point?

### Professionalism

As I practice today, on my birthday, I reflect on what it is to be a professional. To my mind comes Bill Evans's notion of improvisation over a formal structure — essentially, that we must always know where we are within that structure, and to move through the structure using a system that we understand.

As I continue my practice and study I see how some musical ideas I had arrived at earlier in my life fit into a broader system. In my earlier incarnation, I had stumbled blissfully upon sounds with which I resonated and I held on to those few sounds or groupings of sound. But I did not wield these sounds within a system using which I could move freely — I could move along the few paths I had found, but I could not "venture freely" (this is actually a deep subject; because to the outside observer, I _could_ and did freely improvise, but I had often felt constrained by my limitations — and I suppose that it is this way to the very end, and in the best case, we do our best).

In the most idealized sense, the professional wields sounds within a system. There is a place for the playful, joyful discovery; but the professional is not _limited_ to that. And so the professional must "wield" or "command" a system.

There is also a seriousness that Bill Evans spoke of: to play beautiful music, one must be completely, continuously _present_.

### Dataism

Earlier today, on my lunch break, I read a short, fascinating essay called "From Myth to Dataism" (by Byung-Chul Han in _The disappearance of rituals_). What is "dataism"? It's a relatively new "-ism" to denote the emerging era of data-driven metrics, processing, insight (and, perhaps, of "cyborgs" — that is, of cybernetic organisms — in the sense that _the human being is data-driven_; see also: Donna Haraway).

In this essay we trace the broad shift across time:

- Mythology - philosophy as agonistic, ritualistic _play_
- Plato - transition from _myth_ to _truth_
  - "along the path towards work, thinking gradually distances itself from its origin in play"
- Kant - Enlightenment
  - Subordination of play to work and production (of knowledge).
  - A la a Copernican Revolution, "Kant's universe is centered around a free, autonomous subject as the institution that provides the forms and laws of knowledge."
- Dataism
  - "The human being is no longer the sovereign subject of knowledge, the originator of knowledge. _Knowledge is now produced mechanically_.- "The human being itself is reduced to a data set, a variable that can be calculated and manipulated."
  - "The proponents of dataism would argue that humans invented thinking because they cannot calculate fast enough, and that the age of thinking will prove to be a short historical interlude."

Thinking is seen for its non-linear, narrative function: "Thinking has a character of play. Under the compulsion of work and production, it becomes alienated from its essence."

### My day job (I _do_ work as a programmer!)

In order to have any hope of operating a microservices architecture in production — without losing our minds, we _must_ have the monitoring in place that allows us to achieve at-a-glance insights on the broad patterns of operation within the system:

- determining that services are up (or _were_ up, at some point in time) must not require more than a glance at dashboard
- tracing the flow of a single request across multiple services must not require reading individual log statements — domain expertise is needed to identify what qualifies as a "request" (or "flow" or "use case") in a microservices architecture
- errors must be aggregated into an actionable narrative — every non-retriable error should roll up into a "flow" or "use case" — we should know _before our users even think to report an error_ which use cases, and which instances of those use case in particular (identified by any and all relevant identifiers) are blocked by non-retriable errors.

The goal with all of this monitoring is to use the real-time system metrics to create actionable narratives around the questions that we must be able to answer. It is a fallacy to build an enormous distributed system that does not support this type of introspection.

But the good news is that we can get there. We have the tools (we use Splunk at work, which is awesome!).

### On my birthday, continued

I spoke with my Dad's partner. She imparted some (Russian) wisdom.

> Красота правит миром

Some philosophers thought so. It could be translated "beauty governs the world". (I am with [Schiller](https://plato.stanford.edu/entries/schiller/#LettAestEduc) on this one: in the best case, it is true.)

> Пусть будет солнце, пусть буду я.

Thus wrote a child in the sand. It could be translated "let there be sun, let there be me."

My Dad suggested that simply being "healthy and strong" (здоровым и сильным) encompasses and makes that quote redundant.
