---
tags: machine-learning
---

## Output metrics

### R-Squared/Adjusted R-Squared - higher is better

How much variability in the dependent variable can be explained by the model; how much of the distribution has been captured by the model.

Ratio of "sum of squared differences between predicted and actual values" and "sum of squared differences between mean and actual values."

\begin{equation}
R^2 = 1 - \dfrac{\sum\limits_{i}( y_{i}- \hat{y_{i}} )^{2}}{ \sum\limits_{i}(y_{i}-\bar{y_{i}})^{2} }
\end{equation}

### Mean Squared Error (MSE) - lower is better

Measures goodness of model fit. Higher errors are penalized more (due to being squared).

\begin{equation}
MSE = \frac{1}{N}\sum\_{i=1}^{N} (y_{i} - \hat{y_{i}})^2
\end{equation}

\begin{equation}
RMSE = \sqrt{MSE}
\end{equation}

### Mean Absolute Error (MAE) - lower is better

Also measures goodness of model fit, but higher prediction errors are weighted equally with lower prediction errors.

\begin{equation}
MSE = \frac{1}{N}\sum\_{i=1}^{N} |y_{i} - \hat{y_{i}}|
\end{equation}

### Differences

Models can overpredict or underpredict. This can be caused by differences in distribution between the test and training sets.

## Model fitting in practice

* Split data into training/validation/test sets (60/10/30% or 70/10/20%).
* Pick an _output metric_.
* Build model
  * Train model on training data.
  * Evaluate _output metric_ on validation data.
  * Iterate until _output metric_ is achieved; fix the model.
  * Report _output metric_ from fixed model on test data.


## Generalized Linear Models

TODO.