---
title: 'Inference: Hypothesis Testing'
tags: stanford-statsprob
---

Today I got an overview of hypothesis testing. Details to come.

Statistical **hypothesis testing** is defined as assessing evidence provided by the data in favor of or against some claim about the population. It breaks down into 4 steps.

# 1. State the claims

We state (and subsequently evaluate) two claims,
* the **null hypothesis** $$H_0$$ and
* the **alternate hypothesis** $$H_a$$.

The null hypothesis claims that the population we're studying doesn't differ in any way from the general population, or that there is "nothing special going on" with the population -- everything is as it should be, while the alternate hypothesis claims that there _is_ something special about our population.

For example,
* $$H_0$$: the proportion of software engineers among the San Francisco working population is 0.5%, the same as among the United States working population.
* $$H_a$$: the proportion of software engineers among the San Francisco working population is higher than 0.5%.  

# 2. Choose the sample and collect data

We collect the data and summarize it by providing sample statistics such as sample proportion ($$\hat p$$), sample mean ($$\bar x$$), and sample standard deviation ($$s$$). Additionally we provide a **test statistic** (to be used in the 3rd step).

# 3. Assess the evidence

Based on the data, we are trying to draw conclusions about whether or not there is enough evidence to reject the null hypothesis ($$H_0$$).
We determine the **p-value** -- the probability of observing the evidence given $$H_0$$ is true. The test statistic from step 2 is used to calculate the p-value. The lower the p-value the more surprising it is to see the data that we see.

If the p-value is very low, but yet we _do_ observe the data, we are able to **reject the null hypothesis** and accept the alternate hypothesis. If the p-value is _not_ very low -- it is at least moderately likely to observe our data given the null hypothesis is true -- we do _not_ have enough evidence to reject the null hypothesis; we cannot accept the alternate hypothesis.

# 4. Draw conclusions

There is a guideline used as a "cutoff" for when it's acceptable to reject the null hypothesis, called the **significance level of the test**, usually denoted by $$\alpha$$. The most commonly used significance level is $$\alpha = 0.05$$, so that 
* when the p-value is below 0.05, we consider the data surprising enough ("**the results are statistically significant**") to reject the null hypothesis (we reject $$H_0$$ and accept $$H_a$$) and
* when the p-value is above 0.05, the data do _not_ provide sufficient evidence to reject the null hypothesis ("**the results are not statistically significant**") -- we do not reject $$H_0$$ _nor_ do we accept $$H_a$$. 
  * Critically **we never have definitive evidence to accept the null hypothesis**, no matter how high the p-value might be -- we only reject it (and accept $$H_a$$) in the first case or do _not_ reject it.

When summarizing our results, we should not just "reject the null hypothesis" but also provide contextual commentary like "... and conclude that ..."
