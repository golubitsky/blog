---
tags: svm linear-algebra
title: Vectors For Fun, Profit, And SVMs
--- 
As part of my ongoing effort to gain an intuition of SVMs, let's take a closer look at vectors and what we can do with them. In particular, I worked through [this explanation](https://www.svm-tutorial.com/2014/11/svm-understanding-math-part-2/) of calculating the shortest distance between a point and a hyperplane.
<!-- TODO: newcommand needs to be in central location.. -->
$$
\newcommand{\norm}[1]{\left\lVert #1 \right\rVert}
\newcommand{\vectorproj}[2][]{\textit{proj}_{\vec{#1}}\vec{#2}}
\newcommand{\scalarproj}[2][]{\textit{comp}_{\vec{#1}}\vec{#2}}
$$

Given two points in space, $$A$$ and $$B$$, a vector $$\vec{v} = \vec{AB}$$ has
* a **tail**, the start of the vector, at $$A$$
* a **head**, the end of the vector, at $$B$$

The vector is drawn as an arrow pointing from tail $$A$$ in the direction of the head $$B$$.

A vector has both **magnitude** and **direction**.

## Magnitude aka Norm
Given two endpoints of a vector we can work out the magnitude of the vector using Pythagoras' Theorem. This is called the **norm** of the vector:

$$
  \norm{\vec{v}} = \sqrt{\vec{v} \cdot \vec{v}} \tag{Norm/Magnitude}\label{Norm/Magnitude}
$$

For example:

\begin{equation}
  a = (0,0) \quad\quad b = (3,4) \\
\end{equation}
\begin{equation}
  \vec{u} = \vec{ab} = \langle 3,4 \rangle \\
\end{equation}
\begin{equation}
  \norm{\vec{u}} = \sqrt{3^2 + 4^2} = 5
\end{equation}


## Direction
Direction of a vector is commonly defined as an angle $$\theta$$ of its counterclockwise rotation about its tail from some axis of reference. In 2 dimensions this axis of reference is commonly the positive X-axis, such that a vector $$\langle 0,1 \rangle$$ would have $$\theta = 90^\circ$$.

In a right triangle, the **inverse tangent** (written as $$\tan^{-1}$$ or $$\arctan$$) answers the question "knowing the lengths of the opposite and the adjacent sides, what is the angle $$\theta$$ between them?" 

\begin{equation}
  \theta = \tan^{-1}\bigg(
    \frac{\text{opposite}}{\text{adjacent}}
  \bigg)
\end{equation}

As it happens, that's exactly the setup when we have a 2d vector such as $$\vec{u}$$ (above). We have the lengths of the two sides -- the values of the vector, so here's how we can calculate its direction:

\begin{equation}
  \theta_{\vec{u}} = \tan^{-1} \bigg(
      \frac{\vec{u}_1}{\vec{u}_2}
    \bigg) = \tan^{-1} \bigg(
      \frac{3}{4} \bigg)
    \approx 53.13^\circ
\end{equation}

### Unit Vector $$\vec{\hat v}$$ of a Vector $$\vec{v}$$
For any vector $$\vec{v}$$ we can calculate a **unit vector** $$\vec{\hat v}$$ ("v hat") having $$\text{magnitude} = 1$$ in the same direction as $$\vec{v}$$. This unit vector defines the relative components of $$\vec{v}$$ in each dimension, with the constraint that $$\text{magnitude} = 1$$.

\begin{equation}
  \vec{\hat v} = \frac{\vec{v}}{\norm{\vec{v}}} \tag{Unit Vector}\label{Unit Vector}
\end{equation}

This is derived using the formula for cosine. In two dimensions (and this notion can be extended to higher dimensions), we have two angles ($$\theta$$ and $$\alpha$$) that together compose the right angle between the vertical and horizontal axes, separated by the vector, such that

\begin{equation}
  \cos(\theta) = \frac{\text{adjacent}}{\text{hypotenuse}} = \frac{\vec{v}_1}{\norm{\vec{v}}}
\end{equation}

and

\begin{equation}
  \cos(\alpha) = \frac{\text{adjacent}}{\text{hypotenuse}} = \frac{\vec{v}_2}{\norm{\vec{v}}}.
\end{equation}

## Dot Product
We have the equivalence of the [algebraic](https://en.wikipedia.org/wiki/Dot_product#Algebraic_definition) and [geometric](https://en.wikipedia.org/wiki/Dot_product#Geometric_definition) definitions of the dot product, respectively:

\begin{equation}
  \vec{a} \cdot \vec{b} = \norm{a}\norm{b}cos\theta.
\end{equation}

There's a [derivation of the geometric definition of the dot product](https://www.svm-tutorial.com/2014/11/svm-understanding-math-part-2/) on this page.

We can note, having defined the dot product, that because $$cos(90^\circ) = 0$$, **if $$\vec{a}$$ and $$\vec{b}$$ are perpendicular**,

\begin{equation}
  \vec{a} \cdot \vec{b} = 0.
\end{equation}

## Vector Projections

If we have two vectors $$\vec{a}$$ and $$\vec{b}$$ with an angle of $$\theta$$ between them,
* the **scalar projection** of $$\vec{a}$$ onto $$\vec{b}$$ is the portion (component) of the magnitude of $$\vec{b}$$ used to complete a right triangle along with the angle $$\theta$$ and $$\vec{a}$$

\begin{equation}
  \scalarproj[b]{a} = \norm{a}cos(\theta) = \frac{\vec{a} \cdot \vec{b}}{\norm{\vec{b}}}
\end{equation}

* the **vector projection** of $$\vec{a}$$ onto $$\vec{b}$$ is the vector (parallel to $$\vec{b}$$) with the magnitude of the scalar projection -- a unit vector $$\hat b$$ times the scalar projection of $$\vec{a}$$ onto $$\vec{b}$$.

\begin{equation}
  \vectorproj[b]{a} = \hat{b} \cdot \scalarproj[b]{a} = \bigg(
    \frac{\vec{b}}{\norm{\vec{b}}} 
  \bigg) \cdot \bigg(
    \frac{
        \vec{a} \cdot \vec{b}
      }{
        \norm{b}
      }
  \bigg) = \frac{
      \vec{a} \cdot \vec{b}
    }{
      \norm{\vec{b}}^2} \vec{b
    }  
\end{equation}

I have a [course in Linear Algebra](https://ocw.mit.edu/courses/mathematics/18-06-linear-algebra-spring-2010/) ahead of me.

## Computing Distance From Point To Hyperplane
In the context of SVMs we have 
* A hyperplane $$H_0$$ specified by $$\vec{w}^T\vec{x} = 0$$ (our decision boundary).
* The weight vector $$\vec{w}$$ that defines the hyperplane; **important**: it is inherently perpendicular to the hyperplane.
* A point $$a = (x_0, y_0)$$ at the head of a vector $$\vec{x}$$.

We want to compute the shortest distance between a training example $$x$$ and the hyperplane $$H_0$$. If we project $$\vec{x}$$ onto $$\vec{w}$$ we will have the shortest distance from our training example to the hyperplane, which, as we've noted, is inherently perpendicular to the weight vector $$\vec{w}$$. 

\begin{equation}
  \mathrm{distance_{shortest}(H_0, x)} = \scalarproj[\vec{w}]{x}
\end{equation}

and

\begin{equation}
  \mathrm{vector_{shortest}(H_0, x)} = \vectorproj[\vec{w}]{x} = \hat{w} \cdot \scalarproj[\vec{w}]{x}.
\end{equation}

## Finding The Optimal Hyperplane

Having found the distance from a point to a hyperplane, we can note that this distance multiplied by 2 is the **margin** of separation between the hyperplane and that particular point:

\begin{equation}
  m = 2 \cdot \mathrm{vector_{shortest}(H_0, x)}
\end{equation}

|Given|Can Compute|
|:-:|:-|
|Hyperplane ($$H_0$$)| $$H_0$$'s margin w.r.t. a training sample|
|Margin delimited by two hyperplanes ($$H_1$$ and $$H_2$$)|Third hyperplane ($$H_0$$) passing in the middle of the margin|

Finding the biggest margin, is the same thing as finding the optimal hyperplane.

* Get 2-class dataset of $$n$$ samples of $$p$$ features, with each feature having a corresponding $$y_i \in \{-1, 1\}$$
  * Assume linear separability of dataset.
* Our goal is to select two hyperplanes $$H_1$$ and $$H_2$$ with _no samples between them_.
* We can't visualize $$p$$-dimensional data, so we need math to determine the location of the margin hyperplanes.