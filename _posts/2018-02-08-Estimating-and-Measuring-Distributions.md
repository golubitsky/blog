---
tags: stanford-statsprob
---
## Estimating the shape of distributions
We can use our existing knowledge and intuition to estimate the shape of a given distribution. For example let's consider the following 5 distributions.
* SAT Math scores of 1,000 future engineers and scientists.
* Results of rolling a six-sided die 1,000 times.
* Cholesterol levels of 1,000 adults.
* Shoe sizes of 1,000 men and women.
* Prices of 1,000 California homes.

The first one will be skewed left because we assume most future engineers and scientists will do well on the Math SATs. The second one will be uniform. The third one will probably be normal (though doctors may have more insight). The fourth one will be a bimodal normal distribution, because men tend to have overall larger shoe sizes. The last one will be skewed right because there will be a trickle of outliers constituting the mansions of the Hollywood Hills and Marin County.

## Measuring the center of distributions
There are three ways to do it:
* mean (average of all values), _very sensitive to outliers (because it factors in their magnitude)_
* mode (most common value)
* median (center of sorted values), _resistant to outliers_

Calculating a mean from a histogram is called a "weighted average."

## Measuring Distribution Spread (Variability)
### Range
max(data) - min(data)

### Inter-[quartile](https://en.wikipedia.org/wiki/Quartile) range (IQR)
1. Find the median
2. Find the median of the lower half and the upper half of the data
3. This divides the data into 4 quartiles
4. IQR is range of the middle two quartiles. IQR should only be used as a measure of range when the median is used as a measure of the center of the data.  

### Five-number summary 
(min, Q1, M, Q3, Max) provides a quick numerical description of both the center and spread of a distribution.

### Classifying outliers
[There is no rigid mathematical definition](https://en.wikipedia.org/wiki/Outlier#Detection) of what consitutes an outlier. One rule of thumb: 
* low outliers < Q1 - 1.5(IQR)
* high outliers > Q3 + 1.5(IQR)

### Three different kinds of outlier
#### Keep 
If the outlier can be understood to have been produced by essentially the same sort of physical or biological process as the rest of the data, and if such extreme values are expected to eventually occur again, then such an outlier indicates something important and interesting about the process you're investigating, and it should be kept in the data (e.g. a particularly high-magnitude earthquake).
#### Remove
If an outlier can be explained to have been produced under fundamentally different conditions from the rest of the data (or by a fundamentally different process), such an outlier can be removed from the data if your goal is to investigate only the process that produced the rest of the data (e.g. a stock underperforming in a given month due to legal proceedings which are unexpected to recur).
#### Correct + Keep / Remove
An outlier might indicate a mistake in the data (like a typo, or a measuring error), in which case it should be corrected if possible or else removed from the data before calculating summary statistics or making inferences from the data (and the reason for the mistake should be investigated).

### Standard deviation
The [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation) quantifies the spread of a distribution by measuring how far the observations are from their mean; it gives the average (or typical distance) between a data point and the mean. To find the Standard Deviation (SD):
1. Find the mean
2. For each value, find the deviation from the mean
3. (each deviation ** 2) / n - 1 
* Why not divide by n? Will come back to this.
* This average of the squared deviations is called the variance of the data. Variance is relevant to the inference (the 4th) part of the [Big Picture of Statistics]({{ "/2018/02/06/Python-Pandas-Statistics-Big-Picture" | relative_url }})
4. SD = sqrt(variance)
* Square root to undo the original squaring to calculate the variance, which is the average of squared deviations

The SD is interpreted as "on average the _actual sample value_ is SD away from the mean."

### The Standard Deviation (aka "Empirical") Rule
For normal distributions, the SD Rule provides another way to interpret the standard deviation:  
  
| % of samples | within # standard deviations from mean |
| :-:|:-:|
| 68 | 1 |
| 95 | 2 |
| 99.7 | 3 |

## Choosing summaries for quantitative variables
### Numerical summaries  
  
| Distribution Type | Numerical Summary  |
| :-: |:-:|
| Reasonably symmetric, no outliers | Mean + standard deviation |
| Skewed and/or contains outliers | Five-number summary (Min, Q1, M, Q3, Max), Range, IQR |

### Graphical summaries
The [histogram](https://en.wikipedia.org/wiki/Histogram) is most appropriate for visualizing the distribution of a single quantitiative variable. A [boxplot](https://en.wikipedia.org/wiki/Box_plot) can be useful for quickly identifying outliers and particularly for comparing the distributions of two or more groups side-by-side.

The center of the distribution is more meaningful as a typical value for the distribution when there is little variability (little "noise") around it. When there is large variability, the center loses its practical meaning as a typical value.
