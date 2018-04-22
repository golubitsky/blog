---
tags: svm calculus linear-algebra optimization
title: Lagrange Multipliers And Constrained Optimization
---
<!--
  How to define the Lagr operator:
    https://tex.stackexchange.com/a/11144  
    https://tex.stackexchange.com/q/28042
  Declaration appears below in weird place due to spacing issue.
  TODO: Get this into a global Jekyll/LaTex preference file of some sort ("preamble?").
  Possibly define MathJax macros in MathJax.html?
  http://docs.mathjax.org/en/latest/tex.html#defining-tex-macros
  Didn't work in any way I tried.
--> 
$$
  \newcommand{\Lagr}[1]{\operatorname{\mathcal{L}}(#1)}
  \DeclareMathOperator{\Lagr}{\mathcal{L}}
$$
What follows are my notes in working through the [Khan Academy videos on the Lagrangian](https://www.khanacademy.org/math/multivariable-calculus/applications-of-multivariable-derivatives/lagrange-multipliers-and-constrained-optimization/v/constrained-optimization-introduction)!

## Problem Formulation
To understand the Lagrangian, let's suppose we are trying to maximize a multi-variable function

$$
\max\limits_{f}f(x,y) = x^2y
$$

such that

$$
x^2 + y^2 = 1
$$

## What We're Trying To Do

In this example, we are maximizing a two-variable function based on constraints. Constraints are a subset of the function space. Let's call the max $$M^* = f(x^*, y^*)$$ where $$x^*$$ and $$y^*$$ are the values of $$x$$ and $$y$$ that maximize $$f$$ while satisfying the constraints. The max $$M^*$$ will be found where $$f$$ is tangent to each of the constraints. We can find the $$M^*$$ by increasing a constant $$c$$ until $$f(x,y) = c$$ is tangent to each of the constraints, such that we are evaluating the function while "meeting" the constraints. "Increasing a constant $$c$$" actually means traversing the function space of $f$ perpendicular to its contour lines. To gain a better understanding of contour lines and how to traverse the function space perpendicular to them, we need the gradient.

## Gradient

We can use the **gradient** to find the point where $$f$$ is tangent to each of the constraints (in our example and for the rest of this post we will only look at using one constraint). The gradient is a vector of the partial derivatives of $$f$$ of each of the variables of the function evaluated at a given point. In this case the gradient ($$\nabla$$, "nabla") is the vector

\begin{equation}
  \nabla f = \begin{bmatrix}
  \frac{\partial{f}}{\partial{x}} \\\
  \frac{\partial{f}}{\partial{y}}
  \end{bmatrix}.
\end{equation}

The gradient -- while it's easiest to imagine a vector in 3 dimensions, it is actually a vector having a size of whatever is the dimensionality of $$f$$ -- points in the direction where $$f$$ will be maximized relative to the point at which the gradient is evaluated. Moving in the opposite direction (as in Gradient Descent!) will minimize $$f$$ relative to the point, and finally, moving perpendicularly with respect to the gradient will not change the value of the multi-variable function -- we will be traveling along a **contour line** $$f(x, y) = c$$ for some constant $$c$$. Contour lines are always perpendicular to the gradient.

To summarize, we are looking for the point of $$f$$ that
* is tangent to (i.e. touches but doesn't intersect) the constraints, and
* maximizes $$f$$.

So when we find our solution, we're going to be on *some* contour line of $$f$$ that is tangent (just touches) the constraint, which at this point is expressed as a single contour line.

## Introducing The Lagrange Multiplier

But suppose we rewrite our two-variable constraint as a function

$$
g(x, y) = x^2 + y^2.
$$

Seeing that our constraint $$x^2 + y^2 = 1$$ represents a single contour line of $$g$$ (of an infinity of contour lines), we can frame our problem as

\begin{equation}
  \nabla f(x^*, y^*) = \lambda \nabla g(x^*, y^*).
\end{equation}

where $$\lambda$$ is a **Lagrange Multiplier** -- which is some constant -- and $$(x^*, y^*)$$ is the solution to our optimization objective.

### The Main Idea
The main idea is that when the contour line of one function ($$f$$) is tangent to the contour line of the other ($$g$$), their gradients will be parallel. The gradients won't be equal in magnitude but they will point in the same direction -- we represent this using the Lagrange Multiplier $$\lambda$$.

Evaluating the partial derivatives we have

\begin{equation}
  \nabla f = \begin{bmatrix}
  2xy \\\
  x^2
  \end{bmatrix} \quad
  \nabla g = \begin{bmatrix}
  2x \\\
  2y
  \end{bmatrix}.
\end{equation}

## System Of Equations To Solve Our Problem
We can now define the system of three equations that characterizes our optimization problem:

\begin{equation}
  2xy = \lambda 2x \tag{1}\label{1}
\end{equation}
\begin{equation}
  x^2 = \lambda 2y \tag{2}\label{2}
\end{equation}
\begin{equation}
  x^2 + y^2 = 1 \tag{3}\label{3}
\end{equation}

Equations $$\eqref{1}$$ and $$\eqref{2}$$ specify what's necessary for the contour lines of $$f$$ and $$g$$ to be tangent to each other and $$\eqref{3}$$ satisfies the original constraint of our optimization problem. From here we simply solve for $$x$$ and $$y$$.

## Summary Of Approach

To solve a constrained optimization problem we:
1. Find the gradient of the function we're optimizing
2. Find the gradient of the constraining function(s)
3. Set the gradients from steps 1 and 2 proportional to each other using a Lagrange Multiplier
4. Solve the resulting set of equations.

## Solving The System Of Equations

If we assume that $$x \neq 0$$ we can simplify our system of equations to

\begin{equation}
  y = \lambda
\end{equation}
\begin{equation}
  x^2 = 2y^2
\end{equation}
\begin{equation}
  2y^2 + y^2 = 1
\end{equation}

respectively, by working down through equations 1 through 3. Further, we can simplify to 

\begin{equation}
  x^2 = 2(\frac{1}{3})^2 \rightarrow x = \pm \sqrt{\frac{2}{3}}
\end{equation}
\begin{equation}
  y = \pm \sqrt{\frac{1}{3}}
\end{equation}

by working "up" from the simplified third equation and plugging that result into the simplified second equation -- we care specifically about the values of $$x$$ and $$y$$, not necessarily of $$\lambda$$.

If $$x = 0$$ from $$\eqref{3}$$ we get $$y \pm 1$$, and plugging that into $$\eqref{2}$$ we get that $$\lambda = 0$$ -- this cannot be true because it is meant to be a proportionality constant. So we have four potential solutions where the contour lines of $$f$$ and $$g$$ are tangent that will maximize $$f$$:

$$
  x^*, y^* = \pm \frac{2}{3}, \pm \frac{1}{3}.
$$

Plugging each of those into $$f(x, y) = x^2y$$ we get the solution: $$M^* = f(\pm \frac{2}{3}, \frac{1}{3})$$.

## The Lagrangian Function

**The Lagrangian** ($$\Lagr$$, aka "curvy L") is a function whose gradient, when set to 0, gives the multi-variable input values one set of which will maximize $$f$$ (whichever one does, as in the above example). It packages up the notion of $$\nabla f = \lambda \nabla g$$ along with the constraint $$g(x, y) = b$$ (where $$b$$ is the constant value of the constraint, 1 in the above example) into one equation.

$$
\Lagr{(x, y, \lambda)} = f(x,y) - \lambda(g(x, y) - b) \tag{Lagrangian}\label{Lagrangian}
$$

If we set the gradient of the Lagrangian equal to 0

$$
  \nabla{\Lagr} = \begin{bmatrix}
  \frac{\partial{\Lagr}}{\partial{x}} \\\
  \frac{\partial{\Lagr}}{\partial{y}} \\\
  \frac{\partial{\Lagr}}{\partial{\lambda}}
  \end{bmatrix} = \begin{bmatrix}
  \frac{\partial{f}}{\partial{x}} - \lambda \frac{\partial{g}}{\partial{x}} \\\
  \frac{\partial{f}}{\partial{y}} - \lambda \frac{\partial{g}}{\partial{y}} \\\
  -(g(x, y) - b)
  \end{bmatrix} = \vec{0}
$$

we see that the three equations expressed by $$\nabla{\Lagr} = 0$$ are exactly \eqref{1}, \eqref{2}, and \eqref{3}! Wild.

The advantage of using the Lagrangian is that it turns our constrained optimization problem into an unconstrained optimization problem, which we can use an algorithm to solve (e.g. [using SciPy](http://kitchingroup.cheme.cmu.edu/blog/2013/02/03/Using-Lagrange-multipliers-in-optimization/)).

## What The Lagrangian Multiplier $$\lambda$$ Means
We've seen that solving for $$\nabla \Lagr(x, y, \lambda) = \vec{0}$$ will yield some set of solutions $$[x^*, y^*, \lambda^*]$$ such that one of the sets, when plugged into $$f(x^*, y^*)$$ yields $$M^*$$, the solution to our optimization problem.

Up till now we have not been concerned with the multiplier $$\lambda^*$$. If we reconsider our Lagrangian function to use not a constant but a variable constraint $$b$$

$$
\Lagr{(x, y, \lambda, b)} = f(x,y) - \lambda(g(x, y) - b)
$$

it turns out that

$$
  \lambda^* = \frac{dM^*}{db}
$$

the resulting lambda represents the rate of change of the optimum of our function with respect to varying the constraint (i.e. changing the contour line of the constraining function). 

### Application of $$\lambda$$
In the above example that would mean answering the question "how would increasing the size of the constraining circle in $$g(x, y) = x^2 + y^2 = b$$ (where $$b$$ had been set to 1 above) impact the solution to our optimization problem?" This is more useful in a business context where the function we're optimizing ($$f$$) is Revenue and the constraint ($$g$$) is Budget, such that $$\lambda^*$$ facilitates the answer to "how would an increase in budget affect revenue?"

## Why Does $$\lambda$$ Mean That?

TBD - the final video goes through the proof.