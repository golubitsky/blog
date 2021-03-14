---
tags: probability
---

Some basic definitions
(more detail in an [earlier post]({{ "2018/02/08/Estimating-and-Measuring-Distributions" | relative_url }})):

\begin{equation}
\sigma \tag{Sigma}
\end{equation}

\begin{equation}
\mu \tag{Mu}
\end{equation}

\begin{equation}
\sigma_X = \sqrt{\sigma_X^2} \tag{Standard Deviation}
\end{equation}

\begin{equation}
\sigma_X^2 \tag{Variance}
\end{equation}

### Normal distribution

The normal distribution (aka Gaussian distribution) is an important continuous probability distribution that occurs frequently.

The probability density function (pdf) for the normal distribution can be found [here](https://en.wikipedia.org/wiki/Normal_distribution).

We can say:

\begin{equation}
X \sim N(\mu, \sigma^2) \tag{X is distributed normally}
\end{equation}

\begin{equation}
Z \sim N(0, 1) \tag{Standard normal distribution}
\end{equation}

Probabilities are areas under the curve of a probability density function; we can use integrals, a standard normal table, or software to find them.

### Binomial distribution

### Poisson distribution

> In a way, the Poisson distribution can be thought of as a clever way to convert a continuous random variable, usually time, into a discrete random variable by breaking up time into discrete independent intervals. This way of thinking about the Poisson helps us understand why it can be used to estimate the probability for the discrete random variable from the binomial distribution. The Poisson is asking for the probability of a number of successes during a period of time while the binomial is asking for the probability of a certain number of successes for a given number of trials.

[source](https://opentextbc.ca/introbusinessstatopenstax/chapter/poisson-distribution)

### Bayes Theorem