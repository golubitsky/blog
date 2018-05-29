---
tags: meta
title: Models In Tegmark's Life 3.0 And Pearl's The Book Of Why
--- 

I recently read from both [Max Tegmark](https://en.wikipedia.org/wiki/Max_Tegmark)'s [Life 3.0](https://en.wikipedia.org/wiki/Life_3.0) and [chapter 1](http://bayes.cs.ucla.edu/WHY/why-ch1.pdf) of [Judea Pearl](https://en.wikipedia.org/wiki/Judea_Pearl)'s The Book Of Why. The first author is a physicist and the other a computer scientist who developed the first [Bayesian Networks](https://en.wikipedia.org/wiki/Bayesian_network). I haven't finished either book yet, but I was interested to note that both authors define a three-tier model: Tegmark writes about the evolution of lifeforms in general, whereas Pearl looks at human consciousness in particular. In this post I attempt to articulate each of the three-tier models.

## Max Tegmark: Evolution of Lifeforms' Ability To Learn

Tegmark focuses on how lifeforms learn: he states that the first stage of life received upgrades only to its hardware via evolution. Generations of bacteria evolved by surviving in dangerous environments, thereby "learning." The next (middle) stage can also upgrade its own software -- this is what humans do by learning to cook, studying Physics, or a programming language -- it's our straightforward notion of learning. The final stage of life will additionally be able to upgrade its own hardware -- this will be some version of a superintellgence. It will therefore be completely free from its reliance on biological evolution. Tegmark views this as the ultimate lifeform.

It's interesting that the author attempts to stretch the meaning of both "learning" (~upgrades to an agent's decision-making abilities) and of "life" (~an agent, particularly one that makes decisions and whose ability to make decisions can be upgraded).

|Stage| Characteristics|
|:-:|:-:|
| **Life 1.0** | Evolution facilitates upgrades to the organism's "hardware" == learning; no upgradable "software"; e.g. bacteria |
| **Life 2.0** | Hardware upgraded via evolution; redesigns own software by learning new skills and abilities; e.g. humans |
| **Life 3.0** | Redesigns both its software and hardware, breaking free of evolution, e.g. "superintelligence" |


## Judea Pearl: Evolution of Human Consciousness

Pearl's thesis is that our current set of statistical machine learning techniques is far from [superintelligence](https://en.wikipedia.org/wiki/Superintelligence) and even from human-level AI.

>The successes of deep learning have been truly remarkable, and have caught many of us by surprise. Nevertheless, deep learning has succeeded primarily by showing that certain questions or tasks we thought were difficult are in fact not so difficult. It has not addressed the truly difficult questions that continue to prevent us from achieving human-like AI. The result is that the public believes that "strong AI," machines that think like humans, is just around the corner or maybe even here already. In reality, nothing could be farther from the truth.

>What we have gotten from deep learning instead is machines with abilities--truly impressive abilities--but no intelligence. The difference is profound, and lies in the absence of a model of reality.

<div style="text-align: right">–Judea Pearl, The Book Of Why</div><br>
In the first stage of consciousness an entity observes its surroundings and makes decisions based on past events; in the second stage the entity engages in "deliberate alterations of the environment" toward some goal; in the last stage the entity can "imagine worlds that have never existed" in order to infer causation and learn and invent. Here Pearl introduces the notion of "counterfactuals," which are by definition not based on existing data (hence this is beyond the scope of current machine learning models). We use these counterfactuals to answer questions of causality and Pearl writes that this is the hallmark of all of humanity's technology. "Finding out why a treatment worked on some people and not on others can lead to a new cure for a disease." 

### The Limitation Of Probability
The probability statement $P(Y|X) > P(Y)$, that is, "the probability of $Y$ given $X$ is greater than the probability of $Y$, speaks only about past observations. This is at the heart of the statistics mantra that [correlation is not causality]({{ "/2018/02/19/Producing-Data-Designing-Studies" | relative_url }}). Probability doesn't offer a language to describe causality and answer questions on the third stage of Pearl's model of consciousness.

I've ordered the book at the library and am excited to keep reading.

|Stage| Characteristics|
|:-:|:-:|
| **Seeing/Association** | Passively observe events and look for regularities to determine association between events in the past; e.g. current ML/statistical techniques, some animals |
| **Doing/Intervention** | Experiment with interventions; "if I take this pill, will my headache go away?" ; e.g. cavemen|
| **Imagining/Counterfactuals** | "No experiment in the world can deny treatment to an already treated person and compare the two outcomes;" imagine worlds that have never existed; retroactive answers to "what if" and "would have" questions; laws of science; philosophical theory, scientific discovery, and technological innovation |