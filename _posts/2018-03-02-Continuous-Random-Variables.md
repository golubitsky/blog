---
title: Continuous Random Variables & Normal Distribution
tags: stanford-statsprob probability
---
Continuous random variables can take on any value in an interval, so that all of their possible values cannot be listed (e.g. height, weight, temperature, time). We can sort of think of continuous variables as discrete random variables where the size of each discrete measurement approaches 0.

The points in such a distribution can be represented by a smooth curve called a probability density curve (or [probability density function](https://en.wikipedia.org/wiki/Probability_density_function)). The area under such a curve adds up to 1, just like in the histogram for a discrete random variable. Curiously, since a continuous random variable can take on *any* value in an interval, the probability of $$X = x$$ is actually 0 -- there are an infinity of individual values in any given interval. The probability that $$X$$ takes on a value between $$a$$ and $$b$$ is equal to the area under the curve between $$X = a$$ and $$X = b$$.

Density curves (like probability histograms) may have *any* shape as long as the total area underneath the curve is 1, as specified by this definite integral:

\begin{equation}
  \int_{a}^{b} f(x)dx = 1
\end{equation}

There are several important density curves:
* [normal random variables](https://en.wikipedia.org/wiki/Normal_distribution)
* [t random variables](https://en.wikipedia.org/wiki/Student%27s_t-distribution)
* [chi-square random variables](https://en.wikipedia.org/wiki/Chi-squared_distribution), and
* [F random variables](https://en.wikipedia.org/wiki/F-distribution)

Statistical software provides probabilities for areas of these important density curves (or alternatively we can use calculus). I don't yet know much of anything about any of the above 4 examples.

# Normal Random Variables

There are many normal distributions. All of them have the bell-shape, but they differ in center and spread. Their symmetry indicates that values a given magnitude below the mean are as likely as values the same magnitude above the mean. Their bell-shape indicates that values near the mean are most likely; and that values become increasingly unlikely at the edge of the distribution. The center of a normal distribution is determined by its mean ($$\mu$$) and its spread is determined by the standard deviation ($$\sigma$$).

The normal curve plays an important role in [sampling theory](http://www.course-notes.org/statistics/sampling_theory) and in the ultimate goal of statistics -- to relate sample means or proportions to population means or proportions (and thereby make conclusions about a population based on a sample).

While we can use the 68-95-99.7 rule (aka [Standard Deviation Rule]({{ "/2018/02/08/Estimating-and-Measuring-Distributions" | relative_url }})) to gain a rough idea of the shape of a normal distribution given a mean and standard deviation, we have to use different techniques to get more precise estimates of particular values along a given normal distribution curve.

## Z-score
The first step to assessing a probability associated with a normal value is to determine how many standard deviations ($$\sigma$$) the value is from the mean ($$\mu$$.

\begin{equation}
  z = \frac{x - \mu}{\sigma} \tag{z-score}
\end{equation}

For example, given a mean male shoe-size of 11 and a standard deviation of 1.5, to standardize the value of 13, we calculate the z-score like this: $$z = \frac{13 - 11}{1.5} = 1.33$$. We've "**standardized** the value of 13." The z-score (aka [standardized score](https://en.wikipedia.org/wiki/Standard_score)) tells us how many standard deviations above or below the mean a given value is (note z-scores can be negative).

Z-scores are particularly useful in comparing values from two different distributions.

## Normal Tables

Since there are infinity different normal distributions, in order to estimate the probability of a value, we can convert to a z-score, and look up the area under the curve to the left of the z-score, aka the cumulative probability up to the standardized value, $$P(Z \leq z$$) in a [standard normal table](https://lagunita.stanford.edu/asset-v1:OLI+ProbStat+Open_Jan2017+type@asset+block/probability_normal_table.html).

## Normal Table Functionality in Python

In SciPy, we have z-table-equivalent functionality in the [module for normal distributions](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.norm.html) by evaluating the cumulative distribution function for a normal distribution with a given z-score ($$z$$ &rarr; $$P(Z < z)$$).

{% highlight python %}
  import scipy.stats as st
  # having a z-score, evaluate the cumulative distribution function for P(Z < z)
  st.norm.cdf(1) # 0.84134474606854293
  st.norm.cdf(2) # 0.97724986805182079
{% endhighlight %}

Conversely, having the value of a cumulative distribution function for a normal distribution it's possible to find $$z$$ using the "percent point function" -- in other words, if we know the percentile we can calculate the number of standard deviations away from the mean that percentile is ($$P(Z < z)$$ &rarr; $$z$$). 

{% highlight python %}
  # having a cumulative distribution function value (from a z-table),
  # calculate the z-score 
  st.norm.ppf(.5) # 0
  
  # calculate the probability that a value is 
  # within 3 standard deviation from the mean
  st.norm.cdf(3) - st.norm.cdf(-3) # 0.99730020393673979
{% endhighlight %}

Note that "percent point functions are usually used to denote a specific inverse function ... [Percent point functions exist for a wide range of distributions](http://www.statisticshowto.com/inverse-distribution-function/) including the gamma distribution, Weibull distribution, triangular distribution, and many more."

> Science is what we understand well enough to explain to a computer. Art is everything else we do.

<div style="text-align: right">–Donald Knuth</div>