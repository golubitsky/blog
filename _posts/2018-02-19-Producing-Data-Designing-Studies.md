---
title:  "Producing Data - Designing Studies"
tags: stanford-statsprob
---
After the process of sampling is complete (we've decided which individuals will participate in our study), we move on to gaining information about the variables of interest from the sampled individuals. The type and details of the design used determine what kind of conclusions we may draw from the study. Crucially, details of the study design can impact our ability to establish evidence of causation.  

We study three different ways of determining the values of the variables: observation studies, sample surveys, and experiments.

# Observation Studies
In observational studies, values of the variable(s) of interest are recorded as they naturally occur, without researcher interference. There are
* **retrospective observation studies**, which record variables' values from events in the past, and
* **prospective observation studies**, which record variables' values as they occur.

## Pitfalls
* Prospective studies might affect the individuals' behavior due to self-consciousness (similar to Hawthorne Effect below)
* Retrospective studies are subject to the individuals' memories and commitment to honesty.  
* Subject to the effects of lurking variables

Lurking variables can make it particularly difficult to establish causation in observational studies. Great care has to be taken to design a study in such a way as to control for lurking variables. There are potentially always unaccounted-for lurking variables. If obvious lurking variables are controlled, we may claim than an observational study provides good evidence of causation; but we can never be sure that there aren't any other lurking variables that we didn't anticipate. Therefore, we can come closer to establishing causation, but never really establish it.

# Sample Surveys
Sample surveys are a particular type of observational study in which individuals report variables' values themselves, frequently including opinions. Surveys are subject to bias introduced by the way questions are phrased:
* Open vs. closed questions -- _What is your favorite music genre?_ vs _Which of x,y,z is your favorite music genre?_
  * Closed questions may be biased by the options they provide and should include "Other" and "Not Sure" as options
  * Open questions are less restrictive but difficult to summarize
* Unbalanced response options -- e.g. the response options are biased towards positive responses
* Leading questions -- e.g. implanting bias in the way a particular question is phrased
  * Questions should be neutrally phrased.
* Planting ideas with questions -- ordering questions in such a way as to bias responses to subsequent questions
* Complicated questions -- difficult to accurately interpret for the person answering the question
* Sensitive questions -- subject to dishonest responses (e.g. "do you use illegal drugs?")

# Experiments
In experiments, researchers assign values of the explanatory variable to the individuals; when properly designed they *can* provide evidence of causation. The key to establishing causation is ensuring that individuals differ only with respect to explanatory values. The best way to accomplish this (i.e. to control for lurking variables) is **randomized assignment** to treatment groups -- this method automatically controls for all lurking variables. We can check the distributions of non-explanatory variables across the treatment groups to confirm that they are more or less equal. The resulting design is called a **randomized controlled experiment**, because researchers control values of the explanatory variable with a randomization procedure.

Randomization may be employed at two stages of an experiment: sample selection, and in the assignment of treatments. The former may aid generalization from our study to the general population, but the reality of most experimental settings is that a convenience or volunteer sample is used. The important thing is to make sure these subjects are randomly assigned to one of the treatments.

## Double Blind Experiments
Making subjects blind avoids the placebo effect (equalizing such that all subjects believe they are getting actual treatment). Making researchers blind avoids conscious or subconscious influences on their subjective assessment of responses. A randomized controlled double-blind experiment is generally optimal for establishing causation.

## Pitfalls
* Depending on the variables of interest, researching their relationship via an experiment may be unethical (alcohol intake) or impractical (income levels). 
* [Hawthorne Effect](https://en.wikipedia.org/wiki/Hawthorne_effect) -- subjects modify their behavior due to being observed
* **Lack of realism (lack of ecological validity)** -- experiments must be conducted in simulated and/or special environments
* **Noncompliance** -- failure of subjects to submit to the assigned treatment

Note, the word control is used in at least three different senses in various study-design contexts:

|Context|Sense|
|:-:|:-|
|Observational Study|Control for a confounding variable by separating it out.|
|"Controlled Experiment"| The values of the experiment's explanatory variables have been assigned by researchers, as opposed to having occurred naturally. 
|"Control Group"| In experiments, subjects who do not receive a treatment, but who are otherwise handled identically to those who do receive the treatment.|