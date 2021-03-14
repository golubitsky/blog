---
tags: machine-learning
---

There may be other ML glossaries (e.g. [google](https://developers.google.com/machine-learning/glossary)), but this one will be mine, for terms that I have encountered.
Sidenote: it's possible to sort HTML tables using [this Chrome extension](https://chrome.google.com/webstore/detail/html-table-auto-sort/bpgbkjehkeffmmjfmdlmjjlffgkdcljp/related?hl=en).

| Term                                                | Domain       | Definition                                                                                                                   |
| --------------------------------------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| collinearity                                        | statistics   |                                                                                                                              |
| independent identically distributed (IID) variables | statistics   |                                                                                                                              |
| multicollinearity                                   | statistics   |                                                                                                                              |
| best fit line                                       | statistics   | The line learned by regression model; predictions based on this line; can be a hyperplane.                                   |
| dependent variable                                  | statistics   | Variable that will be predicted                                                                                              |
| independent variable                                | statistics   | Variable used in making a prediction                                                                                         |
| hyperparameter                                      | ml           | "meta" parameter used to control the learning algorithm itself (and not the model)                                           |
| training set                                        | ml           | used to fit the model                                                                                                        |
| test set                                            | ml           | used for unbiased evaluation of model                                                                                        |
| validation set                                      | ml           | used for unbiased evaluation of model while setting hyperparameters                                                          |
| regression                                          | statistics   | Predict a continuous dependent variable                                                                                      |
| classification                                      | statistics   | Predict a categorical dependent variable                                                                                     |
| ground truth                                        | statistics   | actual observed values                                                                                                       |
| normal equation                                     | optimization | Equation to determine parameters $$\theta$$ that will yield best fit line; requires calculating inverse of matrix $$O(N^3)$$ |
| gradient descent                                    | optimization | Iterative algorithm to determine parameters $$\theta$$ that will yield best fit line                                         |
| regularization                                      | optimization |                                                                                                                              |
| elastic net regularization                          | optimization |                                                                                                                              |
| L1 regularization                                   | optimization |                                                                                                                              |
| L2 regularization                                   | optimization |                                                                                                                              |
