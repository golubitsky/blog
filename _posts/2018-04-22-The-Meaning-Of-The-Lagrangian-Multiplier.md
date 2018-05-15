---
tags: svm calculus optimization chain-rule
---
<!-- TODO: As in the previous post this DeclareMathOperator should be in some centralized place somewhere. --> 
$$
  \DeclareMathOperator{\Lagr}{\mathcal{L}}
$$
What follows is a bit of a further excursion from the main quest of understanding Support Vector Machines, to answer the question: what does the Lagrangian multiplier actually represent? I'll try to reproduce [Grant Sanderson's explanation](https://www.khanacademy.org/math/multivariable-calculus/applications-of-multivariable-derivatives/lagrange-multipliers-and-constrained-optimization/v/proof-for-the-meaning-of-lagrange-multipliers). Tomorrow I'll come back to gaining deeper intuition of SVMs, armed with the newfound understanding of the Lagrangian!

## What The Lagrangian Multiplier $$\lambda$$ Represents
In the [previous post]({{ "/2018/04/21/2-Lagrange-Multipliers-and-Constrained-Optimization" | relative_url }}), we've seen that $$\nabla \Lagr(x, y, \lambda) = \vec{0}$$ (the gradient of the Lagrangian equal to the vector 0) will yield some set of solutions $$\{x^*, y^*, \lambda^*\}$$ such that one of the sets, when plugged into $$f(x^*, y^*)$$ yields $$M^*$$, the solution to our optimization problem.

Up till now we have not been concerned with the multiplier $$\lambda^*$$. If we reconsider our Lagrangian function to use **not a constant but a variable constraint $$b$$**

$$
\Lagr{(x, y, \lambda, b)} = f(x,y) - \lambda(g(x, y) - b) \tag{1}\label{1}
$$

it turns out that

$$
  \lambda^* = \frac{dM^*(b)}{db}
$$

the resulting lambda represents the rate of change of the optimum of our function with respect to varying the constraint (i.e. changing the contour line of the constraining function). 

### Application of $$\lambda$$
In the example from the previous post that would mean answering the question "how would increasing the size of the constraining circle in $$g(x, y) = x^2 + y^2 = b$$ (where $$b$$ had been set to 1) impact the solution to our optimization problem?" This is particularly useful in a business context where the function we're optimizing ($$f$$) is Revenue and the constraint ($$g$$) is Budget, such that $$\lambda^*$$ facilitates the answer to "how would an increase in budget affect revenue?"

## But Why Does $$\lambda$$ Mean What It Means?

### The Setup
If we note that
* $$M^*$$, the solution to our optimization problem, is a function of $$x^*$$ and $$y^*$$, and 
* the values of $$x$$ and $$y$$ that solve our optimization problem, $$x^*$$ and $$y^*$$, are functions of $$b$$ (the contour line of the constraining function), and that
* as stated above, we consider our Lagrangian as a function of a **variable** $$b$$

altogether we get

$$
  M^*(b) = f(x^*(b), y^*(b)).
$$

This expresses the fact that in order to arrive at our solution $$M^*$$ we evaluate $$f$$ as a function of $$x^*$$ and $$y^*$$ which are _themselves_ a function of our constraint $$b$$. Phew.

So how to we get from here to 

$$
  \lambda^* = \frac{dM^*(b)}{db}?
$$

### Evaluating The Lagrangian At Its Maximum

Now let's consider a function 

$$
  \Lagr^*{(x^*(b), y^*(b), \lambda^*(b), b)} = f(x^*(b),y^*(b)) - \lambda^*(g(x^*(b), y^*(b)) - b)
$$

where $$\Lagr^*$$ is the special variable-constraint-Lagrangian that has constant values of $$x^*$$, $$y^*$$, and $$\lambda^*$$ that satisfy the constraint of our optimization problem -- critically, such that $$\nabla \Lagr^* = \vec{0}$$ for the partial derivatives of those three variables.

Let's also note that the second term of the variable-constraint-Lagrangian, $$\lambda^*(g(x^*(b), y^*(b)) - b)$$, necessarily equals 0 when we plug in $$x^*, y^*$$ and $$\lambda^*$$: the constraint must hold for those values, and if the constraint holds, $$g(x,y) = b$$.

So we see that the variable-constraint-Lagrangian evaluated at $$x^*, y^*$$ and $$\lambda^*$$ equals simply $$f(x^*, y^*)$$, which is the solution to our optimization problem, $$M^*$$.

Finally, since $$\Lagr^*{(x^*(b), y^*(b), \lambda^*(b), b)} = M^*$$, we can look at $$\frac{d\Lagr^*}{db}$$ to determine how $$M^*$$ changes as a function of $$b$$, in other words, our old friend, $$\frac{dM^*(b)}{db}$$! 

### Multivariable Chain Rule

So how do we determine how $$\Lagr^*$$ changes with respect to $$b$$? We have to compute its derivative. In order to do that we need some multivariate Calculus skills.

In [its simplest form](https://youtu.be/NO3AqAaAE6o?t=522) the **Multivariable Chain Rule** states that

$$
  \frac{d}{dt}f(x(t), y(t)) = \frac{\partial{f}}{\partial{x}} \cdot \frac{dx}{dt} + 
                              \frac{\partial{f}}{\partial{y}} \cdot \frac{dy}{dt},
$$

which we can generalize in the **vectorized form** as a dot product

$$
  \nabla f(\vec{v}(t)) \cdot \vec{v}'(t)
$$

where $$\vec{v}$$ is a vector of functions of $$t$$ in all dimensions of $$f$$.

### Multivariable Versus Single Variable Chain Rule
As a further aside, this is reminiscent of the **Single Variable Chain Rule**

$$
  \frac{d}{dx}f(g(x)) = f'(g(x)) \cdot g'(x)
$$

except now the outer function is decomposed into a partial derivative, and each of the inner functions has its own derivative.

### Computing The Derivative of $$\Lagr^*$$
We can now express the derivative of our special variable-constraint-Lagrangian as

$$
  \frac{d\Lagr^*}{db} = \frac{\partial\Lagr}{\partial x^*}\frac{dx^*}{db} +
                        \frac{\partial\Lagr}{\partial y^*}\frac{dy^*}{db} +
                        \frac{\partial\Lagr}{\partial \lambda^*}\frac{d\lambda^*}{db} +
                        \frac{\partial\Lagr}{\partial b}\frac{db}{db}
$$

or in its vectorized form

$$
  \nabla \Lagr^*(\vec{v}(b)) \cdot \vec{v}'(b).
$$

This derivative looks kind of intimidating. But we can use some magic to simplify it. 

First of all let's note that to compute the derivative of $$\Lagr^*$$, the special single variable Lagrangian, we use $$\Lagr$$ itself -- the four variable Lagrangian \eqref{1}. This trick will prove particularly useful because by definition, the partial derivative of $$\Lagr$$ with respect to any of $$x^*$$, $$y^*$$, and $$\lambda^*$$ equals 0 -- a condition necessary for $$\Lagr = M^*$$. So each of the first 3 terms goes to 0! Cool. 

Noting that $$\frac{db}{db}$$ is simply 1, we're left with just

$$
  \frac{d\Lagr^*}{db} = \frac{\partial\Lagr}{\partial b}.
$$

### The Meaning Of $$\lambda$$

What's interesting is that the derivative of $$\Lagr^*$$ happens to equal its _partial_ derivative with respect to $$b$$. This is owing particularly to the fact that the specific values of $$\Lagr^*$$ at which we're interested in evaluating its derivative happen to be those that completely cancel out all of those other partial derivatives.

Finally, let's evaluate $$\frac{\partial\Lagr}{\partial b}$$. The first term of the Lagrangian has no $$b$$ in it, so it will contribute nothing to the partial derivative. The second term yields $$-\lambda^*(b)$$, such that we have 

$$
  \frac{d\Lagr^*}{db} = \frac{\partial\Lagr}{\partial b} = \lambda^*(b).
$$

What does this all mean? At $$M^*$$ -- the value which solves our optimization problem and maximizes $$f$$ given the constraint $$g(x,y) = b$$ _and_ which is what the Lagrangian evaluates to at said solution values -- has a derivative of $$\lambda^*(b)$$, which is, as we said above,

$$
  \lambda^* = \frac{dM^*(b)}{db}.
$$

Mind blown. I'm gonna let that simmer for a while and get back to SVMs tomorrow!