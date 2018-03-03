---
tags: stanford-statsprob probability
---

It is intuitive that when we take multiple identically-sized random samples from a population, we expect some variability of the sample mean ($$\bar x$$) and sample standard deviation ($$s$$) among the samples. We similarly also don't expect any $$\bar x$$ or $$s$$ to exactly match the mean ($$\mu$$) and standard deviation ($$\sigma$$) of the population. This is called **sampling variability**.

A **parameter** is a number that describes the population. Parameters are usually unknown -- the whole point of statistical inference is to infer parameters. 

**Statistics** are numbers that are computed from a sample; they can vary due to sampling variability.

The behavior of the possible values a statistic can take in repeated samples is called the **sampling distribution** of that statistic. Statistics can be regarded as random variables whose distribution we call sampling distribution.

||(Population) Parameter|(Sample) Statistic|
|:-:|:-:|:-:|
|**Proportion**|$$p$$|$$\hat p$$|
|**Mean**|$$\mu$$|$$\bar x$$|
|**Standard Deviation**|$$\sigma$$|$$s$$|

The new term in the above table is **proportion**:
\begin{equation}
  \hat p = \frac{x}{n} = \frac{\text{number of successes}}{\text{number of observations in sample}}
\end{equation}

## The Sampling Distribution is Approximately Normal

The following table shows when and how we can estimate the sampling distribution to be normal for categorical and quantitative variables.

<table style="text-align:center">
  <tr>
    <th colspan="3"></th>
    <th colspan="3">Sampling Distribution</th>
  </tr>
  <tr>
    <th>Variable</th>
    <th>Parameter</th>
    <th>Statistic</th>
    <th>Center</th>
    <th>Spread</th>
    <th>Shape</th>
  </tr>
  <tr>
    <td>Categorical (e.g. left-handed or not</td>
    <td>$$p$$</td>
    <td>$$\hat p$$</td>
    <td>$$p$$</td>
    <td>
      $$\sigma_{\hat p} = \sqrt{
        \frac{
          p(1 - p)
        }{
          n
        }
      }$$
    </td>
    <td>Normal if $$np \ge 10$$ and $$n(1 - p) \ge 10$$</td>
  </tr>
  <tr>
    <td>Quantitative (e.g. weight)</td>
    <td>$$\mu \ \mathrm{and} \ \sigma$$</td>
    <td>$$\bar x$$</td>
    <td>$$\mu$$</td>
    <td>
      $$\sigma_{\bar x} = \frac{
        \sigma
      }{
        \sqrt{n}
      }$$
    </td>
    <td>Normal if n > 30 for skewed population distributions; always normal if population normal</td>
  </tr>
</table>

One small thing I'm confused about is how to write the equation for the standard distributions of $$\hat p$$ and $$\bar x$$ -- I've used $$\sigma_{\hat p}$$ and $$\sigma_{\bar x}$$ because they represent the standard deviations _of parameters of a population of_ samples. It's a bit inception-y. Maybe for this reason I was unable to locate any resource that specifies these values in an equation; they all just write "and the standard deviation is..."

### Categorical Variables: Mean and Standard Deviation of Sample Proportions

In the above table, we see that the distribution of sample proportions ($$\hat p$$) has a mean of $$p$$, independent of sample size. We also see that the standard deviation of sample proportions ($$\sigma_{\hat p}$$) is inversely proportional to the sample size -- larger samples will tend to yield $$\hat p$$ closer to $$p$$ and thus less variability. Smaller samples have more variability and a higher chance of yielding $$\hat p$$ further from $$p$$.

### Quantitative Variables

#### Central Limit Theorem: Sampling Distribution of the Sample Mean
The sampling distribution of sample means will be approximately normal as long as the sample size is large enough.

If repeated random samples of a given size $$n$$ are taken from a population of values for a quantitative variable the mean of all sample means ($$\bar x$$) is equal to the mean of the population distribution ($$\mu$$)
* for normal populations regardless of sample size, and
* for skewed populations given a large-enough sample size ($$ n \ge 30$$).

Consequently, for skewed populations, normal approximations should *not* be used for with sample sizes ($$n < 30$$).

The guarantee of $$\bar x = \mu$$ being equal is known as the **Central Limit Theorem**. This theorem is the foundation of statistical inference.

#### Standard Deviation of the Sample Mean

The standard deviation is inversely proportional to the square root of the sample size, such that larger samples yield smaller standard deviations (i.e. less variability) for $$\bar x$$ from $$\mu$$. The standard deviation of the sample distribution ($$\sigma_{\bar x}$$) will always be smaller than the standard deviation of the population ($$\sigma$$).
