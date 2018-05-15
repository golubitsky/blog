Notation used in Andrew Ng course:

|Symbol|Meaning|
|:-:|:-:|
|$$m$$|             number of training examples|
|$$n$$|             number of features|
|$$x^{(i)}_j$$|     value of the $$j^{th}$$ feature of the $$i^{th}$$ example|
|$$y^{(i)}$$|       $$i^{th}$$ target value|
|$$\theta_j$$|      value of the $$j^{th}$$ parameter|
|$$h_{\theta}$$|    hypothesis |
|$$\alpha$$|        learning rate|

# Linear Regression
The objective of linear regression is to minimize the **cost function**

\begin{equation}
  J(\theta) = 
    \frac{1}{2m}
    \sum_{i = 1}^{m} 
      (h_{\theta}(x^{(i)}) - y^{(i)}))^2
\end{equation}

where the **hypothesis** $$h_{\theta}(x)$$ is given as the linear model

\begin{equation}
  h_{\theta}(x) = \theta^Tx = \theta_0 + \theta_1x_1
\end{equation}

and the intercept term $$\theta_0$$ is always equal to 1, allowing us to treat it as a parameter for another "feature."

In order to minimize the cost function $$J(\theta)$$, each step of **gradient descent** will simultaneously update all the parameters $$\theta$$:

\begin{equation}
  \theta_j := \theta_j - \alpha 
                          \frac{1}{m}
                          \sum_{i = 1}^{m} 
                            (h_{\theta}(x^{(i)}) - y^{(i)}))x^{(i)}_j
\end{equation}



# Feature scaling and mean normalization
Goal: gradient descent converges more quickly.
Ideally, Approximately -1 .. 1 range and Features are ~= same scale (order of magnitude)
This is not an exact requirement.

Mean normalization

For each feature $$i$$
\begin{equation}
  x_i = \frac{x_i- \mu_i}{s_i}
\end{equation}
where $$s$$ is either the range of the values or the standard deviation of the feature.

Feature scaling is accomplished by the denominator; mean normalization by the numerator.

# How To Choose Learning Rate

Plot the number of iterations vs the value of the cost function $$J(\theta)$$. $$J(\theta)$$ should decrease after every iteration.

If $$J(\theta)$$ increasing, probably $$\alpha$$ is too large.
If $$\alpha$$ is small enough, $$J(\theta)$$ must converge, but $$\alpha$$ should not be too small -- it will be very slow.

# Features and Polynomial Regression

Our hypothesis doesn't need to be linear in order to use multivariate linear regression -- the "linear" in the title comes from "linear in parameters, not necessarily linear in features. We can use the machinery of linear regression to fit a polynomial model by engineering features with degrees higher or lower than 1 if we think that will yield a more accurate model. Feature scaling becomes important when using feature engineering.

# Normal Equation

Method to solve for $$\theta$$ analytically. Can solve for the derivative of the cost function equal to 0. For multivariate linear regression, we should do the same thing for the partial derivative for each feature equal to 0.

$$X$$ is the **design matrix**. It is $$m$$ by $$(n + 1)$$, where the "+ 1" part comes from the extra 0th feature equal to 1 that we add to each training example.

Don't need to do feature scaling.

Can be much faster than linear regression.

## Versus Gradient Descent
Pro
* Don't need to choose $$\alpha$$
* Don't need to iterate
Con
* Need to compute $${X^TX}^{-1}$$ which can be slow if $$n$$ is large (i.e. > 10000) -- cost is roughly $$O(N^3)$$.
* Does not work for other complex algorithms (not linear regression)

## Non-Invertibility of $$X^TX$$
* Redundant features (linearly dependent) like meters squared and feet squared.
* Too many features (e.g. m \leq n) -- delete features or use regularization.

Pseudo inverse (`pinv`) should work, even if inverse (`inv`) doesn't work.