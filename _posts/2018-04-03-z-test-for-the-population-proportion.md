---
title: 'Inference: Z-Test for the Population Proportion'
tags: stanford-statsprob
---

In this post we'll look at the z-test for the population proportion, so-called because it is based on a test statistic that is a z-score. The goal of this test is to establish whether or not we have enough evidence to reject the null hypothesis and accept the alternative hypothesis.

# 1. State the Claims  
We establish the null hypothesis
\begin{equation}
  H_0 : p = p_0
\end{equation}
which states that the population proportion $$p$$ is some nominal value.

We also establish the alternative hypothesis, which will always be **one of the following three** depending on the context of the problem
\begin{equation}
  H_a : p < p_0 \\\
  H_a : p < p_0 \\\
  H_a : p \neq p_0
\end{equation}
and will state that something different is going on in reality.

## Set the Significance Level
We need to set a **significance level**, $$\alpha$$, the probability of rejecting the null hypothesis when it is true. For example if we set $$\alpha = 0.05$$ we have a 5% chance of rejecting a true null hypothesis during step 4 below. The significance level is also referred to as [Type I Error](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors#Type_I_error) -- the chance of a false positive. Significance levels of 0.05 and 0.01 are often used by convention, but there's no one correct value to use, and ultimately the value used is determined by the amount of risk we are willing to take on in the study.

# 2. Obtain Data From the Sample
## Satisfy z-test conditions
* The study uses a random sample (or a sample that can be considered random -- such that the sampling methodology would not affect the proportion being studied)
* $$n \cdot p_0 \geq 10$$ and $$n \cdot (1 − p_0) \geq 10$$

If the above conditions -- which are required for the sampling distribution of the sampling proportion to be normal -- are not satisfied, we cannot proceed.

## Calculate the Test Statistic
Given the above conditions are satisfied, we know that the sample distribution $$\hat p$$ will have a normal distribution with a mean of $$p$$ and standard deviation of $$\sqrt{\frac{p(1 - p)}{n}}$$. As [discussed previously]({{ "/2018/03/02/Continuous-Random-Variables" | relative_url }}) the z-score of a normal value represents how many standard deviations above or below the population mean the value is.

We can measure the z-score for the sample proportion $$\hat p$$ with the population proportion $$p_0$$ assuming that $$H_0$$ is true. This is called the **test statistic**:

\begin{equation}
z = \frac{\hat p - p_0}{
    \sqrt{
        \frac{
            p_0(1 - p_0)
        }{
            n
        }
    }
}.
\end{equation}

The test statistic is the number of standard deviations $$\hat p$$ is from the null value $$p_0$$. It incorporates both the sample size $$n$$ and the sample proportion $$\hat p$$ into one summary statistic.

# 3. Calculate the p-value
The p-value is the probability of obtaining data like those observed assuming that $$H_0$$ is true. P-values are always found using the sampling distribution of the test statistic when $$H_0$$ is true, also known as the **null distribution**. In the case of the z-test we argue that the null distribution of the test statistic is $$N(0, 1)$$ (normal) because we've satisfied the conditions in step 2 above. Thus, we can convert from the z-score test statistic to the p-value because we know that the values of the test statistic follow a normal distribution. In other tests other distributions come up.

The smaller the p-value the less likely we are to see data like those observed given $$H_0$$ is true (the more evidence we have against $$H_0$$). There are some tests (like this one) where we can use the test statistic itself to draw conclusions and don't need to take the extra step of calculating the p-value, but there are other tests where the value of the test statistic is not so easy to interpret; whereas the p-value maintains its intuitive appeal across all statistical tests.

There are three kinds of p-value calculations, depending on the form of the alternative hypothesis $$H_a$$.

## Left-Tailed Test
For $$H_a: p < p_0$$ we use the p-value to signify the probability of observing a test statistic (z-score) **as small as observed or smaller**. So we have a p-value of $$P(Z \leq z)$$. We can use Python's cumulative distribution function to find the p-value:

{% highlight python %}
  from scipy.stats import norm
  norm.cdf(z)
{% endhighlight %}

## Right-Tailed Test
For $$H_a: p > p_0$$ we use the p-value to signify the probability of observing a test statistic **as large as observed or larger**. We can use the CDF again, subtracting from 1 to get the area under the curve for values greater than or equal to the z-score:
{% highlight python %}
  1 - norm.cdf(z)
{% endhighlight %}

## Two-Tailed Test
For $$H_a: p \neq p_0$$ we use the p-value to signify the probability of observing a test statistic **as large in magnitude as observed or larger**. We subtract from 1 as before, and multiply by 2 to get the area under the curve on both sides of the probability curve -- at each tail, denoting the total probability of getting results at least as extreme as observed in the data given that $$H_0$$ is true.
{% highlight python %}
  (1 - norm.cdf(abs(z))) * 2
{% endhighlight %}

# 4. Draw Conclusions Based on the P-Value
The p-value measures how much evidence the data present against $$H_0$$. The smaller it is, the more evidence the data present against $$H_0$$ -- the less probable are the data given $$H_0$$ is true. Using the significance level $$\alpha$$ defined in step 1 above, we determine whether the p-value is below $$\alpha$$, rendering the test results **statistically significant** -- we reject $$H_0$$ and accept $$H_a$$, that "something else is going on." If the p-value is greater than $$\alpha$$ we do not have sufficient evidence to reject $$H_0$$ and continue to believe that it **may** be true -- as mentioned in the previous post, we _never_ accept the null hypothesis.

Finally, we state our conclusions in the context of the problem.