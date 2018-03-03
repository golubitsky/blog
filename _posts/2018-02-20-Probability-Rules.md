---
tags: probability stanford-statsprob
---
# Motivations
Probability is the underlying foundation for the methods of statistical inference. It is the third part in the [Big Picture of Statistics]({{ "/2018/02/06/Python-Pandas-Statistics-Big-Picture" | relative_url }}). We use probability to quantify how much we expect random samples to vary. 
In the final stage of statistical analysis -- Inference -- we attempt to draw final conclusions. During inference, having [selected our sample]({{ "/2018/02/17/Producing-Data-Sampling" | relative_url }}), we know that our uncertainty is due to chance, and not due to problems with how the sample was collected. **We can use probability to describe the likelihood that our sample is within a desired level of accuracy.**

# Fundamentals
Probability is a mathematical description of randomness and uncertainty. Probability $$P(A)$$ quantifies the likelihood of the occurrence of a particular event $$A$$.
* The probability of an event $$A$$ is expressed as a decimal such that $$0 \leq P(A) \leq 1$$.  
* $$P(A)=0$$ means "there is a zero percent chance of $$A$$."
* $$P(A)=1$$ means "there is a hundred percent chance of $$A$$."
* Probability is not always intuitive, as the [Monty Hall](https://en.wikipedia.org/wiki/Monty_Hall_problem) and [Birthday](https://en.wikipedia.org/wiki/Birthday_problem) problems illustrate.

# Determining Probability
There are two fundamental ways in which we can determine probability:
* Theoretical (also known as Classical)
  * Used for games of chance, such as flipping coins, rolling dice, spinning spinners, roulette wheels, or lotteries.
  * "Classical" because their values are determined by the nature of the game (or situation) itself.
* Empirical (also known as Observational)
  * A series of trials are used to determine the **relative frequency**.
  * Used particularly to answer probability questions that arise in a situation that does not follow any pattern and cannot be predetermined (i.e. most probabilities of interest).

\begin{equation}
  \mathrm{Relative \ Frequency \ of \ Event \ } A = 
  {
      \frac
        {\text{number of times } A \mathrm{\ occurred}}
        {\text{total number of trials}}
  }
\end{equation}

The **law of large numbers** states that as the number of trials increases, the relative (empirical) frequency approaches the theoretical probability. In other words, we can estimate the theoretical probability by performing a long series of trials.

# Sample Spaces
In any random experiment we can define a **sample space** $$S$$ that will contain all the possible **outcomes** of the experiment. For example, in the experiment of tossing two coins we would have the sample space $$S = \{ \ HH, HT, TH, TT \ \}$$. Within $$S$$ we can observe **events**, which contain **n** outcomes; for example, the event "at least one tail was tossed" could be defined as $$A = \{ \ HT, TH, TT\ \}$$. Then we can calculate the relative frequency of individual events, e.g. $$P(A) = 0.75$$. In an experiment where every outcome is equally likely this is as simple as counting the outcomes in the event and dividing that total by the total number of outcomes in the sample space.

# Additional Fundamental Concepts
## Union and Intersection
Given $$A = \{ \ 1,2,3 \ \}$$ and $$B = \{ \ 2,3,4 \ \}$$ we have
* Union ("or")
\begin{equation}
  A \cup B = \\{ \ 1,2,3,4 \ \\}
\end{equation}

* Intersection ("and") 
\begin{equation}
  A \cap B = \\{ \ 2,3 \ \\}
\end{equation}

## Disjoint (Mutually Exclusive) Events
Two events A and B are **disjoint** or **mutually exclusive** if they cannot occur at the same time, meaning $$P(A \cap B) = 0$$.

## Independence
Two events A and B are **independent** if the fact that one event has occurred does *not* affect the probability that the other event will occur.  

Two events A and B are **dependent** if whether or not one event occurs *does* affect the probability that the other event will occur.

# Five Probability Rules
## Range Rule
Probabilities can never be less than 0 or greater than 1.
\begin{equation}
  0 \leq P(A) \leq 1 \tag{1}\label{1}
\end{equation}

## Sum Rule
The sum of the probabilities of all possible outcomes (in sample space $$S$$) is 1\.
\begin{equation}
  P(S) = 1 \tag{2}\label{2}
\end{equation}

## Complement Rule
Given $$\eqref{1}$$ and $$\eqref{2}$$,
\begin{equation}
  P(\text{not A}) = 1 - P(A) \tag{3}
\end{equation}

Sometimes it's easier to figure out the complement probability.

## General Addition Rule
* In probability the word "or" is always associated with the operation of addition.
* Note: for disjoint events, $$P(A \cap B) = 0$$
\begin{equation}
  P(A \cup B) = P(A) + P(B) - P(A \cap B) \tag{4}
\end{equation}

## Multiplication Rule For Independent Events
* In probability the word "and" is always associated with the operation of multiplication
\begin{equation}
  P(A \cap B) = P(A) \cdot P(B) \tag{5}
\end{equation}


# Probability Tables
To determine all the values in the table we need to know
* one value in the Total column
* one value in the Total row
* one value out of $$A, B, \text{not A}, \text{not B}$$

Each right and bottom margin contains sums of a row or column.

||B|Not B|Total|
|:-:|:-:|:-:|:-:|
|**A**|$$P(A \cap B)$$|$$P(A) - P(A \cap B)$$|$$P(A)$$|
|**Not A**|$$P(B) - P(A \cap B)$$|$$1 - P(A) - P(B) + P(A \cap B)$$|$$1 - P(A)$$|
|**Total**|$$P(B)$$|$$1 - P(B)$$|$$1$$|

The [two-way tables used to compare two categorical values during EDA]({{ "/2018/02/16/Studies-Involving-Two-Variables" | relative_url }}) record values of two categorical variables for a concrete sample of individuals; whereas the probability two-way table conveys data for an entire population, presumably based on relative frequencies recorded over many repetitions.