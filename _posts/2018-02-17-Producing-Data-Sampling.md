---
title:  'Producing Data: Sampling'
tags: stanford-statsprob
---
The conclusions we are able to draw from our studies will be limited by any bias introduced by our sampling methodology. If random sampling techniques are used accurately, we can minimize bias, thereby maximizing the validity of our studies; but sometimes it is infeasible to collect data in a random way due to budget constraints, whether of money or time, and in those cases it is important to note the bias we are introducing via the sampling methodology. Sampling is the first step (of two, the other being Study Design) in Producing Data of the [Big Picture of Statistics]({{ "/2018/02/06/Python-Pandas-Statistics-Big-Picture" | relative_url }}).

## Sampling
Though it would be ideal to study the _entire_ population we are interested in (as in the US Census), this is often beyond our budget. The next best thing is to study a representative sample. In sampling, we attempt to choose individuals in a population that will be included in a sample in such a way that it really does represent the population of interest.  

The **sampling frame** is a list of potential individuals to be sampled, and it should match the population of interest. Systematically excluding parts of the population may result in **bias**, a systematic tendency to misrepresent the variables of interest in the population. A **biased sample**  under- or over-estimates the values of the variable(s) of interest.

### Analyzing Sample Validity

To analyze the validity of a sample we should compare the distributions of the sample and the population according to the appropriate measures for the distribution; e.g. since SAT scores tend to follow a normal distribution, we can use the means to compare the distributions of the sample and population. For a variable showing a skew (such as age of college students) we should use the median (and 5 number summary) to compare the distributions. (**But what if we don't know the distribution in the general population??**)

### Types of Samples
#### Biased Samples
* **Volunteer Sample** - ask for volunteers
  * almost guaranteed to be biased
  * individuals will tend to have a strong opinion about the issue and welcome the opportunity to voice it
  * cannot generalize to a larger group at all
* **Convenience Sample** - select individuals from a location or time that is convenient to the researcher
  * selecting at particular time and location may lead to biased selection of certain types of individuals
* **Systematic Sample** - get a list of the entire population and sample every Nth person
  * susceptible to some biases, i.e. siblings would be less likely to be selected

#### Probability Sample Plans (Techniques)
Each of these plans, if applied correctly, is not subject to any bias, and thus produce samples that are representative of the population from which they are drawn.

* **Simple random sampling** - "selecting names out of a hat" randomly and without replacement
  * no bias **if** all randomly-selected individuals respond
  * Volunteer Response is not as problematic as in a volunteer sample
  * subject to bias introduced by nonreponse - those who respond might be different w/r/t the variable of interest from those who don't

* **Cluster sampling** - select several clusters randomly and use all individuals of interest in those clusters
  * used when population is naturally divided into groups; e.g. select 3 of 10 high schools in city and use all high school students in each of the 3 schools

* **Stratified sampling** - select several strata and sample each of the strata individually
  * used when our population is naturally divided into sub-populations (strata) such as gender, race, age groups; e.g. choose a random sample of high school students from each of the 10 schools in a city

* **Multistage sampling** - used due to intractability of cluster sampling
  * first select clusters randomly; within each cluster select a stratified sample
  * can have more than 2 stages, e.g. to obtain a random sample of physicians in the US
    * choose 10 states at random (stage 1, cluster)
    * from each state choose at random 8 hospitals (stage 2, cluster)
    * from each hospital, choose 5 physicians from each sub-specialty (stage 3, stratified)
