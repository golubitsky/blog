Classification


Could use regression with a threshold but outliers will cause the model to yield a less-accurate prediction.

Binary Classification Problems

We want the output of our hypothesis to always be between 0 and 1 -- which are the two classes in the binary classification problem. In order to satisfy this constraint, we will put our hypothesis from linear regression ($$\theta^Tx$$) through the **sigmoid (or logistic) function**:

\begin{equation}
  h_{\theta}(x) = g(\theta^Tx)
\end{equation}

where $$g$$ is the logistic function

\begin{equation}
  g(z) = \frac{1}{1 + e^{-z}};
\end{equation}

thus we have the logistic regression model of

\begin{equation}
  h_{\theta}(x) = \frac{1}{1 + e^{-\theta^Tx}}.
\end{equation}

The output of the hypothesis is interpreted as the probability that y = 1, given x, parameterized by theta:
\begin{equation}
  h_{\theta}(x) = P(y = 1|x;\theta).
\end{equation}

It is a property of the logistic function that $$g(z) \geq 0.5$$ when $$z \geq 0$$. If we assume the we'll predict $$y = 1$$ for $$h_{\theta}(x) \geq 0.5$$ and $$y = 0$$ otherwise, we will predict $$y = 1$$ for $$\theta^Tx \geq 0$$, and $$y = 0$$ for $$\theta^Tx < 0$$.

For an input in two dimensions, the **decision boundary** is that line that separates the region of the $$x_1x_2$$ plane where we predict $$y = 0$$ from the region where we predict $$y = 1$$. For values of $$x_1$$ and $$x_2$$ that fall on this line, $$h_{\theta}(x) = 0.5$$.

The decision boundary is a property of the hypothesis and the parameters $$\theta$$, and *not* of the dataset. It is an equation that we can arrive at once we've set all of our parameters for our model. The training set is used to fit $$\theta$$.

We are not limited to linear hypotheses: higher-order polynomial hypotheses will yield non-linear decision boundaries, depending on the particular polynomial/model.