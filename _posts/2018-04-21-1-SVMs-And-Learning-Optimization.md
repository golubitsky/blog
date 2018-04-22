---
tags: svm calculus linear-algebra optimization meta
title: SVMs And Learning Optimization
---
For the past couple of weeks I have been officially working through the material of Andrew Ng's famous [Machine Learning course](http://www.coursera.org/learn/machine-learning/home/welcome), which I consider to be a broad overview of rather than a deep-dive into ML. In the first few sections of the course he covers Linear Regression, Logistic Regression, introduces Neural Networks, and discusses how to troubleshoot algorithms using "levers" such as regularization and the characteristics of the training set size (e.g. will obtaining a higher number of training examples or decreasing the number of features help to achieve a higher accuracy for a classifier?). I've been taking notes, but a lot of this stuff really needs to be in Jupyter notebooks with code interspersed and I haven't yet found a good solution for displaying Jupyter notebooks (whether in this blog or separately). Additionally, I intend to do some more thorough explorations of datasets using the techniques covered in the course and will likely share those, rather than a lot of these notes.

## SVMs Are On Another Level
Having gotten to Support Vector Machines I hit a stumbling block. Other parts of the course have been hard (particularly vectorization of some of the algorithms) but with SVMs I seemed to really be "in outer space" after watching some of the videos. I searched around the internet and found several opinions that
* SVMs are mathematically more complex than the other algorithms discussed thus far, and that
* Andrew Ng's coverage of SVMs in the course, while not impossible to understand, [leaves something to be desired](https://quantmacro.wordpress.com/2016/06/14/support-vector-machines-without-tears-part-1/) for the beginner who lacks deep knowledge of both Linear Algebra and Calculus but wishes to gain deeper understanding of SVMs.

It has turned out that SVMs make the most rigorous use of Linear Algebra that I've seen in all of ML so far. Whereas up till now it was sufficient to have a cursory grasp of vector and matrix multiplication, SVMs introduced me to the first glimpse of multidimensional spaces in which specific concepts relating to vectors are taken for granted, for example that any two perpendicular vectors will have a dot product equal to zero. This is one example of prerequisite knowledge that, if missing, complicates the project of understanding the SVM. My jaw also dropped when I watched a video that demonstrated the [notion of the SVM somehow translating the training set into a higher-dimensional space](https://youtu.be/N1vOgolbjSc?t=18m13s) (using the so-called [Kernel Trick](https://en.wikipedia.org/wiki/Kernel_method)) in which it is able to determine a decision boundary for an otherwise linearly-inseparable training set. Holy cow! Generally, I've noticed that SVMs are 
* instances of [constrained optimization problems](https://en.wikipedia.org/wiki/Constrained_optimization) that 
* use multivariate calculus to
* find decision boundaries in multidimensional spaces,

thus making heavy use of 3 of the pillars of machine learning -- Optimization, Calculus, and Linear Algebra. This is turning out to be my formal introduction to the subject of Optimization (though I know that Gradient Descent is an optimization algorithm).

## Optimization
It's kind of neat to consider that in studying the topic of Machine Learning I too am solving a constrained optimization problem -- to learn enough of these topics in a finite (but variable) amount of time to be useful enough as an ML engineer to get a job in the field.

I know that I am prone to want to "dig" as deeply as possible when learning new material, and that I can often get distracted by this digging until I either forget the original goal or give up entirely. I don't want that to happen, so what I've said to myself is that at this point I don't need to "fully" understand SVMs; after all, Ng's course is supposed to be an overview of all the algorithms -- I can always revisit any subject again to gain deeper understanding. Not only that, but (as with all the other algorithms thus far) implementations are readily [available in scikit-learn](http://scikit-learn.org/stable/modules/svm.html#support-vector-machines).

## Goals
So what are my goals with respect to SVMs? Broadly I'd like to answer these questions. I'll answer these questions in more detail in a future post. 
1. What do SVMs do and how do they do it?
2. When is it appropriate and inappropriate to use SVMs?
3. How do I use an SVM (i.e. parameters and tradeoffs)?

Here are some of the resources I've gone through so far:
* An overview of [the history of SVMs](https://www.svm-tutorial.com/2017/02/svms-overview-support-vector-machines/)
* Some Linear Algebra [background](https://www.svm-tutorial.com/2014/11/svm-understanding-math-part-2/)
* [This resource](https://med.nyu.edu/chibi/sites/default/files/chibi/Final.pdf) also has good explanations of the Linear Algebra involved 
* A [video](https://www.youtube.com/watch?v=N1vOgolbjSc) with a good overview and useful visualizations of decision boundaries.

One particular question I still don't understand the answer to is [how does an SVM choose its support vectors](https://www.quora.com/How-does-a-SVM-choose-its-support-vectors)? Every resource so far has sort of hand-waved "hey, look, these training examples are really close to a potential decision boundary, let's use them as support vectors" -- but nowhere have I found how an algorithm decides which those are. Is it the data scientist who decides them by investigating the data?

Finally, while watching [this video](https://youtu.be/_PwhiWxHK8o?t=23m56s) from another course ([accompanying lecture notes](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-034-artificial-intelligence-fall-2010/readings/MIT6_034F10_svm.pdf)) I realized that ultimately in order to understand what SVMs are actually doing I have to understand the [Lagrangian](https://en.wikipedia.org/wiki/Lagrange_multiplier). This led me to Khan Academy's [treatment of the subject](https://www.khanacademy.org/math/multivariable-calculus/applications-of-multivariable-derivatives/lagrange-multipliers-and-constrained-optimization/v/constrained-optimization-introduction).

In the next post I'll share my notes in working through the Khan Academy videos on the Lagrangian!