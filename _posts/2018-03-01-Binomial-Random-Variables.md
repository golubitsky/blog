---
tags: stanford-statsprob probability
---

**Binomial experiments** have
* a fixed number of trials $$n$$, where 
* each trial has only two possible outcomes, "success" (having probability $$p$$) and "failure" (having probability $$1 - p$$), where
  * "success" is defined as the condition which we are trying to satisfy, e.g. making a free throw, answering a question correctly, flipping a coin and getting "heads,"
* the "success" probability $$p$$ is constant for all trials, and finally
* all trials are independent of each other.
  * A rule of thumb is we can assume independence if the sample size is less than or equal to 1/10th of the population size.
 
The binomial random variable $$X$$ represents the number of "successes" in those $$n$$ trials given probability of success $$p$$. We can say "$$X$$ is binomial with $$n = ...$$ and $$p = ...$$" The trials in binomial experiments are known as [Bernoulli Trials])(https://en.wikipedia.org/wiki/Bernoulli_trial).

# [Probability Mass Function](https://en.wikipedia.org/wiki/Probability_mass_function) for a Binomial Random Variable
In a binomial experiment, we can count the number of possible outcomes having $$k$$ successes:
\begin{equation}
  \frac{n!}{k!(n - k)!} \tag{Number of combinations}
\end{equation}
which has a shorthand version:
\begin{equation}
  \binom{n}{k} \tag{Number of combinations shorthand}
\end{equation}

The pmf is a function that gives the probability that a discrete random variable is exactly equal to some value; thus we can express the probability distribution as
\begin{equation}
  P(X = x) = \frac{n!}{x!(n - x)!}
    p^x
    (1 - p)^{n - x}
  , \ \mathrm{for} \ 0 \leq x \leq n
\end{equation}
where we're multiplying the number of ways we can get $$x$$ successes by the probability of getting $$x$$ successes in $$n$$ independent trials.

Scipy (a Python package) has [a function to calculate the probability mass function](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.binom.html) of a random experiment:

{% highlight python %}
  from scipy.stats import binom
  # probability of getting 2 heads out of 3 fair coin tosses
  binom.pmf(n=3, k=2, p=0.5)
{% endhighlight %}
 
# [Cumulative Distribution Function](https://en.wikipedia.org/wiki/Binomial_distribution#Cumulative_distribution_function)

This function answers the question "what's the probability of getting at most $$k$$ successes in a random experiment of $$n$$ trials given success probability $$p$$?" 

{% highlight python %}
  # probability of getting at most 2 heads out of 3 fair coin tosses
  binom.cdf(n=3, k=2, p=0.5)
{% endhighlight %}

# Mean and Variance
For binomial distributions, we have special-case formulas for the mean, variance, and standard distribution:
\begin{equation}
  \mu_X = np \tag{Mean}
\end{equation}
\begin{equation}
  \sigma^2_X = np(1 - p) \tag{Variance}
\end{equation}
\begin{equation}
  \sigma_X = \sqrt{np(1 - p)} \tag{Standard Deviation}
\end{equation}

# Shape of Binomial Distribution
With a small number of trials $$n$$ a $$p$$ closer to 0 or 1 than to 0.5 will yield a skewed-right or skewed-left distribution, respectively; however as $$n$$ increases, the distribution centers around $$p \cdot n$$.