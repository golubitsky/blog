---
title:  "Python/Pandas and The Big Picture of Statistics"
tags: python stanford-statsprob
---

Over the past few days I've dug into a [Python course for Data Science and ML](https://www.udemy.com/python-for-data-science-and-machine-learning-bootcamp). I ought to quickly establish a practical foundation in the tools I anticipate I'll be using most (Python). I've completed sections on Python, NumPy, Pandas, and am currently working through the overview of Matplotlib.

## Pandas
Pandas allows us to import, manipulate, and analyze data from a variety of sources, including CSV and Excel files, SQL databases, as well as even from HTML pages (web scraping). It has a handy [`apply`](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.apply.html) function that allows us to map a function or lambda over a column in a Dataframe (called "Series" in Pandas).

## Stanford Statsprob

In working on the Pandas tutorial I was asked to determine the [correlation between two variables](https://en.wikipedia.org/wiki/Correlation_and_dependence) in a dataset. Though I figured out [how to do so using Pandas]((https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.corr.html)) and intuitively understood what that function returns, I felt like I just had to dive deeper and so started googling for statistics resources and ultimately decided to enroll in the [Stanford statsprob course](https://lagunita.stanford.edu/courses/course-v1:OLI+ProbStat+Open_Jan2017/about). 

Inspirational material from the course intro:

>The feeling of struggling is a normal part of how your brain gets stronger when it learns things.

>Strategies that feel easy, such as skipping the practice problems and only reading and listening, are kind of like going to the gym and lifting balloons instead of weights.

What follows are my notes from the first few sections of the course.

## The Big Picture of Statistics
Statistics is about conveying data into useful information. We collect, summarize, and interpret data.  

Steps in statistical analysis:
1. Produce Data (from a population)
2. Exploratory Data Analysis
3. Probability
4. Inference

First we select a **population** to study -- the entire group that is the target of our interest. Populations are often too large to study in whole and so we choose a sample and collect data from it (**produce data**). We need to ensure we have a representative sample. We perform **exploratory data analysis** (EDA) on the sample in order to draw conclusions about the population. We also need to examine (and factor into our analysis) how the sample might differ from the population; to do so we use probability. **Probability** is the "machinery" that allows us to draw conclusions about the population based on the data collected about the sample.
At the end, we draw conclusions about our population (**inference**).

## Exploratory Data Analysis (EDA)
**Data** are pieces of information about individual samples organized into variables; **variables** are particular characteristics. A **dataset** is a set of data identified with particular circumstances. A **categorical variable** (aka "qualitative") puts individuals into categories. A **quantitative variable** is a numerical measurement that can be averaged.

## Scales of measurement

We can be more precise about scales of measurement than just categorical vs quantitative. Each successive level below has all the characteristics of the preceding levels.  

**Nominal** is the least precise level of measurement; it indicates only differences, e.g. types of pets  
**Ordinal** shows order but not magnitude of difference between two data points, e.g. order of finish in a race, or somewhat likely/likely/extremely likely  
**Interval** - distance between pairs of consecutive values is equal, but the data contains no meaningful zero point, e.g. SAT scores (there's no notion of zero intelligence), temperature (this is confusing to me because there *is* an absolute zero but specifically they draw the distinction that zero in F or C has arbitrary meaning)  
**Ratio** - there is a meaningful zero point, i.e. the zero value indicates the absence of this variable in the sample

We can decrease the scale of measurement, but not increase it  (e.g. age => age group but not vice-versa).

## Examining distributions
In order to understand a dataset we need to summarize the data contained in each variable. This summary is called the **distribution**. The distribution of a variable answers two basic questions:
1. What values does the variable take?
2. How often does the variable take those values?

### Categorical data
There are two simple graphical displays for visualizing the distribution of categorical data: *bar and pie charts*.

### Quantitative data
To display data from one quantitative variable graphically, we can use either the *histogram* or the *stemplot*. Histograms organize data points into bins that are graphed as a bar chart. Interestingly histograms sort of "invert" the axes from
```
x: student
y: number of hours studied for exam
```
to
```
x: number of hours
y: number of students studying a given number of hours
```
### Interpreting the histogram
We examine four things in a histogram:
1. Shape
2. Center
3. Spread
4. Outliers

The first three provide insight into the overall pattern of the data, while the last one shows deviations from the pattern. 

**Shape** - symmetry/skewedness of the distribution and peakedness (modality), i.e. the number of peaks (modes) the distribution has. **Symmetric distributions** can be **unimodal**, **bimodal**, and **uniform**. The right tail is longer in a **skewed right distribution** - most observations are on the lower end of the dataset, while a few are much larger than the rest; vice-versa for **skewed left distributions**. Skewed distributations can also be bimodal.

**Center** - the distribution's midpoint; the value that divides the distribution so that approximately half the observations take smaller values, and approximately half the observations take larger values.

**Spread** (aka variability) - the approximate range covered by the data.
