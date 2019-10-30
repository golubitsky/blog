https://www.youtube.com/watch?v=z5UQyCESW64
Discriminant Algorithms
Learn P(Y|X)


Generative
Learn P(X|Y)


Bottom term "by the definition of how you marginalize probability distributions"


https://machinelearningmastery.com/naive-bayes-classifier-scratch-python/


Logarithm


P(Y) -- "prior" "is this class common"

# About the assumption
What makes Naive Bayes' "naive" is the assumption that all features are independent of each other. For example in spam classification, the presence of the words "penis" and "viagra" are clearly _not_ independent, but for this algorithm we assume that they are. As explained [here](https://youtu.be/iA2nEXanP_o?t=21m34s), we significantly limit the scope of the problem by going from having to learn to designate as one of Y * (number of values of feature 1) * ... * (number of values of feature x) possibilities (which is an exponential total of possibilities), to calculating the conditional distribution of each feature $$P(F_n|Y) and the probability of the class (which is essentially free, given the dataset) -- and so the number of computations is linear in the number of features. This achieves also [statistical efficiency](https://en.wikipedia.org/wiki/Efficiency_(statistics)), which limits how much data we need in order to learn.


Goal: compute posterior distribution over label variable Y
1. get vector of joint probabilities of label and evidence for each label
2. Normalize (i.e. sum up the joint distributions divide by the sum)