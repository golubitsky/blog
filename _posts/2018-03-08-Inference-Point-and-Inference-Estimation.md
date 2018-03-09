---
title: 'Inference: Point and Interval Estimation'
tags: stanford-statsprob
---

Statistical inference means inferring something about the population based on a measured sample.

In statistical inference, the type of variable of interest (categorical or quantitative) determines what population parameter we will infer:
* for categorical variables we infer about the population proportion $p$
* for quantitative variables we infer about the population mean $$\mu$$ associated with the variable.

Three forms of statistical inference are
* Point estimation
  * Estimate an unknown parameter using a single number calculated from the sample data. 
* Interval estimation
  * Estimate an unknown parameter using an interval of values likely to contain the true value of the parameter, as well as quantify a confidence percentage for the interval.
* Hypothesis testing
  * Having a claim about the population, we investigate whether the data provides evidence for the claim.

# Point Estimation

The sample mean $$\bar x$$ is a **point estimator** for the population mean $$\mu$$. A particular value of the point estimator, for example $$\bar x = n$$, is called the **point estimate** for $$\mu$$. The sample proportion $$\hat p$$ is a point estimator for $$p$$.

Generally, statistics are estimators.

## Larger Sample Size → Better Estimate
The standard deviations of the sampling distributions of both a sample mean $$\sigma_{\bar x} = \frac{\sigma}{\sqrt{n}}$$ and a sample proportion $$\sigma_{\hat p} = \sqrt{\frac{p(1 - p)}{n}}$$ decrease with larger sample sizes $$n$$. This is a mathematical justification for our intuitive notion that larger sample sizes will yield more accurate point estimators.

## Unbiased Estimators
A statistic is said to be an **unbiased estimate** of a given parameter when the mean of the sampling distribution of that statistic can be shown to be equal to the parameter being estimated. Point estimates are unbiased only if
* the sample is random, and
* the study design is not flawed.

Provided those requirements are satisfied, as mentioned in a [previous post]({{ "/2018/03/02/Sampling-Distributions" | relative_url }}), the Central Limit Theorem guarantees that the statistics $$\bar x$$ and $$\hat p$$ are unbiased estimators for the parameters $$\mu$$ and $$p$$ respectively.

Another example of unbiased estimator is using the sample variance
$$
s^2 = \frac{
  (x_1 - \bar x)^2 + ... + (x_n - \bar x)^2
}{
  n - 1
}
$$
to estimate the population variance $$\sigma^2$$. We [divide by $$n - 1$$ rather than by $$n$$](https://en.wikipedia.org/wiki/Bessel%27s_correction) to make the estimator unbiased -- in the long-run dividing by $$n$$ would yield a point estimator that slightly underestimated $$\sigma^2$$.

# Interval Estimation
## Motivation
We can't be sure of the accuracy of our point estimates because although the Central Limit Theorem states that the mean of the sampling distributions will be equal to the population mean, it doesn't say anything about the mean of a *single* sample with respect to the population mean (due to natural sampling variation). 

What we want to do is use probability theory to enhance point estimates with information regarding our confidence in the estimate. To do this we use **interval estimation** to express the size of the error attached to our estimate.

## Language and Meaning
We can provide "a $$c$$ % confidence interval for $$\mu$$," where $$c$$ is the confidence percentage.

Given a normal sampling distribution (and the Central Limit Theorem), we can make claims such as "in the long run, 95% of the confidence intervals should cover $$\mu$$." So the "confidence percentage" means specifically that we are $$c$$ % sure that given our *single* sample, our interval estimate will cover the parameter we are estimating -- given probability theory, our single sample might be one of the 5% (i.e. $$100 - c$$ %) that do *not* cover the parameter.

## Confidence Intervals for $$\mu$$

If we know the population standard deviation (which we often don't..) we can use the Standard normal table ("z-table") (or Python's `scipy.stats.norm.ppt`) to determine a desired confidence interval for the population mean $$\mu$$; the equation will have the general form

\begin{equation}
  \text{Confidence interval} = \text{point estimator} \pm \text{margin of error (m)}
\end{equation}

and more specifically 

\begin{equation}
  \text{Confidence interval} = \bar x \pm z^* \frac{\sigma}{\sqrt{n}}
\end{equation}

where $$\bar x$$ is the **point estimator** (the sample mean); the **margin of error** ($$m$$) breaks down into 
* the **desired confidence multiplier** $$z^*$$ (obtained from the standard normal table such that $$z^* = f(z) = f(\frac{1 + c}{2})$$, where $$c$$ is the desired confidence percentage between 0 and 1), multiplied by
* the **standard deviation of the point estimator** $$\bar x$$.

## Margin of Error and the Confidence vs Precision Tradeoff

Generally, the higher the desired confidence, the wider will be the range of the confidence interval. This is because we have only two ways to decrease the margin of error:
* decrease our level of confidence $$z^*$$
* increase the sample size $$n$$, thereby decreasing the sample standard deviation.

Sometimes increasing the sample size is too expensive or impossible and thus there is an important trade-off between the level of confidence and the precision with which the parameter is estimated. Here are some commonly used confidence multipliers:

|Desired Confidence Percentage|$$z^*$$|
|:-:|:-:|
|90%|1.645|
|95%|1.96|
|99%|2.576|

## Determining the Optimal Sample Size

There are some situations where we have control over the sample size, and we can determine the sample size required to provide a confidence interval of width $$2m$$ (and centered on $$\mu$$) for a given confidence $$z^*$$.

\begin{equation}
  n = (\frac{z^*\sigma}{m})^2
\end{equation}

Note that to use this formula we need to know the population standard deviation $$\sigma$$; often we don't know it. In that case we can use a rule of thumb to estimate it:

\begin{equation}
  \sigma_{estimate} = \frac{\text{expected max} - \text{expected min}}{4}
\end{equation}

## When can we use this confidence interval method?

Critically, the sample must be random. Additionally (a restatement of the Central Limit Theorem):

||Small sample size|Large sample size|
|:-:|:-:|:-:|
|**Variable varies normally**|yes|yes|
|**Variable doesn't vary normally**|no (need [nonparametric methods](https://en.wikipedia.org/wiki/Nonparametric_statistics))|yes|

## Python code for confidence interval

{% highlight python %}
  from scipy.stats import norm
  c = 0.99 # desired confidence interval
  z_star = norm.ppf((1 + c)/2) # confidence multiplier
  sigma = 500 # population standard deviation
  n = len(data) # sample size
  xbar = data.mean()
  lower_bound = xbar - z_star*(sigma/np.sqrt(n))
  higher_bound = xbar + z_star*(sigma/np.sqrt(n))
{% endhighlight %}

## Unknown $$\sigma$$

When the population standard deviation is unknown, we lose our ability to use the Central Limit Theorem, along with the normality of $$\bar x$$. The $$z^*$$ confidence multipliers are rendered generally inaccurate.

Instead, we use the sample standard deviation, $$s$$; but as a result, we also need to use a different set of confidence multipliers ($$t^*$$) associated with the [$$t$$ distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

\begin{equation}
  \text{Confidence interval} = \bar x \pm t^* \frac{s}{\sqrt{n}}
\end{equation}

These new multipliers have the added complexity that they depend not only on the level of confidence, but also on the sample size (e.g. $$t^*$$ for 95% confidence when $$n = 10$$ doesn't equal $$t^*$$ for 95% confidence when $$n = 20$$; details are beyond current scope). We can use Python to calculate the "one-sample t confidence interval":  

{% highlight python %}
  from scipy import stats
  c = 0.95
  n = len(data) - 1
  xbar = np.mean(data)
  stats.t.interval(c, n, xbar, scale=stats.sem(sleep))
{% endhighlight %}

Docs for the [scale](https://docs.scipy.org/doc/scipy/reference/tutorial/stats.html#shifting-and-scaling) parameter and [standard error mean](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.sem.html) function above.

In general, whenever we replace parameters with their sample counterparts in the standard deviation of a statistic, the resulting quantity is called the **standard error** of the statistic. In this case, we replaced $$\sigma$$ with its sample counterpart ($$s$$), and thus $$\frac{s}{\sqrt{n}}$$ is the standard error of (the statistic) $$\bar x$$.

### T-distribution vs Normal Distribution
For large $$n$$, the t-distribution is not so different from the normal distribution, and so using interval formula

\begin{equation}
  \text{Confidence interval} = \bar x \pm z^* \frac{s}{\sqrt{n}}
\end{equation}

provides a good approximation.
