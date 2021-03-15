---
tags: machine-learning
---

There may be other ML glossaries (e.g. [google](https://developers.google.com/machine-learning/glossary)), but this one will be mine, for terms that I have encountered.
Sidenote: it's possible to sort HTML tables using [this Chrome extension](https://chrome.google.com/webstore/detail/html-table-auto-sort/bpgbkjehkeffmmjfmdlmjjlffgkdcljp/related?hl=en).

| Term                                                    | Domain       | Definition                                                                                                                                     |
| ------------------------------------------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| **best fit line**                                       | statistics   | The line learned by regression model; predictions based on this line; can be a hyperplane.                                                     |
| **classification**                                      | statistics   | Predict a categorical dependent variable                                                                                                       |
| **correlation**                                         | statistics   | relationship or pattern exists between data; compare causation                                                                                 |
| **causation**                                           | statistics   | one event causes another; determined using experiment with differing outcomes; compare correlation                                             |
| **coefficient of determination**                        | statistics   | see r-squared                                                                                                                                  |
| **collinearity**                                        | statistics   |                                                                                                                                                |
| **dependent variable**                                  | statistics   | Variable that will be predicted                                                                                                                |
| **ground truth**                                        | statistics   | actual observed values                                                                                                                         |
| **multicollinearity**                                   | statistics   | one independent variable can be predicted from another independent variable                                                                    |
| **independent identically distributed (IID) variables** | statistics   |                                                                                                                                                |
| **independent variable**                                | statistics   | Variable used in making a prediction                                                                                                           |
| **heteroscedasticity**                                  | statistics   | not-normally-distributed residuals (errors); invalidates regression model; Greek: hetero=different; skedasis=dispersion                        |
| **r-squared**                                           | statistics   | the proportion of independent variable variation accounted for by the predictor; $1 - \frac{SSE}{SSTO}$                                        |
| **regression**                                          | statistics   | Predict a continuous dependent variable                                                                                                        |
| **variance inflation factor (VIF)**                     | statistics   | measure of multicollinearity against other feature(s); >10 = high multicollinearity; $$\textrm{VIF}_j = \frac{1}{1 - R^2_j}.$$ (see r-squared) |
| **Correlation coefficient**                             | statistics   |                                                                                                                                                |
| **residual plot**                                       | statistics   |                                                                                                                                                |
| **mean squared error (MSE)**                            | statistics   | metric to evaluate regression model, predicted vs actual; $$\sum{(y - \hat{y})}^2$$                                                            |
| **grid search**                                         | ml           | used to exhaustively search a subset of the hyperparamter space for optimal hyperparameters, using some kind of metric                         |
| **hyperparameter**                                      | ml           | "meta" parameter used to control the learning algorithm itself (and not the model)                                                             |
| **one-hot encoding**                                    | ml           | widen categorical feature -> each possible value represented by boolean column; prevents model from learning accidental ordinal relationship   |
| **training set**                                        | ml           | used to fit the model                                                                                                                          |
| **test set**                                            | ml           | used for unbiased evaluation of model                                                                                                          |
| **cross-validation (CV) set**                           | ml           |                                                                                                                                                |
| **validation set**                                      | ml           | used for unbiased evaluation of model while setting hyperparameters                                                                            |
| **overfitting**                                         | ml           | model is too complex, has learned the noise in the data; low bias, high variance;                                                              |
| **underfitting**                                        | ml           | model is too simple; high bias, low variance                                                                                                   |
| **gradient descent**                                    | optimization | Iterative algorithm to determine parameters $$\theta$$ that will yield best fit line                                                           |
| **L1 regularization**                                   | optimization | "lasso"; penalty term is sum of abs. value of weights; leads to sparse solution, some $$\theta_{j} = 0$$                                       |
| **L2 regularization**                                   | optimization | "ridge"; penalty term is sum of squares of weights; helps to shrink $$\theta$$                                                                 |
| **elastic net regularization**                          | optimization | in-between L1 and L2; available in scikit-learn (use `l1_ratio` to determine how much L1 vs L2 is applied)                                     |
| **normal equation**                                     | optimization | Equation to determine parameters $$\theta$$ that will yield best fit line; requires calculating inverse of matrix $$O(N^3)$$                   |
| **regularization**                                      | optimization | technique used to prevent higher-order/more-complex models; extra term(s) to penalize large values of $\sum{\theta}$                           |
| **Probability density function**                        | probability  |                                                                                                                                                |
