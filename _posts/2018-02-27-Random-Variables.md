---
tags: stanford-statsprob probability
---

A random variable assigns a unique numerical value to the outcome of a random experiment. Values for random variables can be determined theoretically or observationally. Random variables and their associated probabilities play an important role in statistical inference.

## Discrete (things we count)
  * values take on one of a finite set of values
  * can take on many values, in which case it's easier to treat them as continuous (like IQ, SAT score, salary) 
  * sometimes we know a variable is discrete, but **can't know the complete set of its values**

## Continuous (things we measure)
  * values take on one of an infinite set of values in an interval
  * can be "rounded" -- like time spent watching TV per week to nearest hour or weight to nearest pound -- but still continuous, though appearing to be discrete

# Discrete Random Variables
## Probability Distributions
Probability distributions consist of 
* all possible values of a discrete random variable, and
* the probability of each of the values.

Probability distributions can be expressed in three ways:

### Table

We can have a random variable $$X$$ with a probability distribution of

|$$X$$|$$x_1$$|$$x_2$$|...|$$x_n$$|
|:-:|:-:|:-:|:-:|
|**$$P(X = x)$$**|$$p_1$$|$$p_2$$|...|$$p_n$$|

### Function
Probability distributions can be expressed as a function $$f$$ where
* $$0 \leq f(x) \leq 1$$, and
* $$\sum f(x) = 1$$ for all values of random variable $$X$$

For example (Python):
{% highlight python %}
  f = lambda x:(x + 2) * (5 - x) / 50.0
  [f(x) for x in range(5)] # [0.2, 0.24, 0.24, 0.2, 0.12]
{% endhighlight %}

### Histogram
Probability functions can be expressed as a histogram with bars for $$x$$ whose corresponding height is $$P(x)$$; thus the total area of the rectangles would equal 1.

## Mean
We can calculate the mean of a discrete random variable $$X$$ by multiplying the value of each observation by the probability of that observation: 
\begin{equation}
  \mu_X = \sum_{i = 1}^n x_ip_i
\end{equation}

The mean tells us the "long-run" average value of the random variable; it's sometimes known as the "expected value" but this is a potentially-misleading term because the variable $$x$$ doesn't necessarily ever equal $$\mu_x$$.

Note: as always, it is important to distinguish between 
* the (observational) mean of a concrete sample of observed values for a variable versus 
* the (theoretical) mean of an abstract population of all values taken by a random variable in the long run.

# Variance and Standard Deviation

Let's say we have a random variable $$X$$ with a probability distribution shown in the table above.

The standard deviation of a random variable describes how far from the mean $$\mu_X$$, on average, is each actual value in a probability distribution.

* The smaller the standard deviation, the less likely the random variable is to be valued further from the mean.
* The higher the standard deviation the larger the probability distributions' spread.
* Values within 2 standard deviations of the mean are considered ordinary (not unusual).
* Useful as a measure of risk -- high variability implies high risk.

To calculate the standard distribution we first need to calculate the variance of $$X$$ ("sigma sub X squared"):
\begin{equation}
  \sigma_X^2 = \sum_{i = 1}^n (x_i - \mu_X)^2p_i \tag{Variance}
\end{equation}

We can then find the standard deviation ("sigma sub x") of random variable $$X$$:
\begin{equation}
  \sigma_X = \sqrt{\sigma_X^2} \tag{Standard Deviation}
\end{equation}

# Linear Transformation of One Random Variable

Let's say we have a random variable with a mean $$\mu_X$$ and a variance of $$\sigma^2_X$$. A new random variable $$a + bX$$ has:
\begin{equation}
  \mu_{a + bX} = a + b\mu_X \tag{Mean}
\end{equation}
\begin{equation}
  \sigma^2_{a + bX} = b^2\sigma^2_X \tag{Variance}
\end{equation}

The variance and standard deviation are not impacted by shifting a probability distribution over, while the mean is.
### An Example of a Linear Transformation
A bridge toll is $3 per car + $0.50 for each person in the car. The number of people in a car is given by a random variable $$X$$ with a mean value 2.7 and a variance of 1.2 people. To calculate the standard deviation of the toll collected: $$\sigma_{Toll} = \sqrt{(\$0.50)^2 \cdot 1.2} = \$0.55$$.

# Sum of Two Random Variables

If we have two random variables $$X$$ and $$Y$$ that measure the same quantity (e.g. number of people entering a building through two entrances per hour), we can combine them into a new variable $$X + Y$$ that will have
\begin{equation}
  \mu_{X + Y} = \mu_X + \mu_Y \tag{Sum of Means}
\end{equation}
and **if the variables $$X$$ and $$Y$$ are independent** (definition of independence of random variables is not expressed formally here), we have
\begin{equation}
  \sigma^2_{X + Y} = \sigma^2_X + \sigma^2_Y \tag{Sum of Variances}
\end{equation}


Additional thoughts:
* I'm starting to see that probably integrals will be useful w/r/t probability distributions for continuous random variables (area under the curve == 1)
* Estimating functions for probability distributions will probably be important -- i.e. "what is $$f(x)$$ given this probability distribution?"