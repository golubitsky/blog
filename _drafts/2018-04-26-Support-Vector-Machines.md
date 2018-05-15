Problem

We have a space with some positive and negative examples. We'll draw a straight line -- a decision boundary -- to separate the examples of the two classes such that the separation of the positive and negative classes -- the "street" -- is as wide as possible. This is different from logistic regression or a neural network in that neither of those algorithms will necessarily find the _optimal_ decision boundary. We'll have to make our notion of "optimal" with respect to the decision boundary more rigorous.

Let's say we have a vector $$\vec{w}$$ that is constrained to be perpendicular to the decision boundary. We don't know anything about its length.
Let's also say way have some unknown (an unseen example) and a vector $$\vec{u}$$ that points to it.

Constrain such that value of the decision rule is +1 in the gutters for the positive samples and -1 in the gutters for the negative samples.

Maximizing the width of the street leads to an expression

$$
  \min \frac{1}{2} \rVert w \rVert^2
$$

that we wish to optimize.




Good resource about gutters and solving SVM problems: http://web.mit.edu/dxh/www/svm.html
SVM for Idiots: http://web.mit.edu/6.034/wwwbob/svm-notes-long-08.pdf