---
tags: decision-trees
--- 

These notes are heavily based on Chapter 3 of [Tom Mitchell's Machine Learning](http://www.cs.cmu.edu/afs/cs.cmu.edu/user/mitchell/ftp/mlbook.html).

# Entropy

Given a training set $$S$$ containing positive ($$+$$) and negative ($$-$$) examples, the entropy of $$S$$ relative to this boolean classification

$$
  \mathrm{Entropy}(S) = -p_{(+)}\log_2 p_{(+)} - p_{(-)}\log_2 p_{(-)}
$$

where $$p_{(+)}$$ is the proportion of positive examples in $$S$$ and $$p_{(-)}$$ is the proportion of
negative examples in $$S$$. In all calculations involving entropy we define $$0 \log{0} = 0$$.

![Entropy function relative to boolean distribution]({{ site.baseurl }}/assets/2018-05-06-Entropy.png "Entropy function relative to boolean distribution")

One interpretation of entropy from information theory is
>the minimum number of bits of information needed to encode the classification of a single arbitrary member of $$S$$

If we have $$p_{(+)} \in \{0, 1 \}$$ we require 0 bits if information to determine the class of a member of $$S$$ because all examples are of a single class. If we have $$p_{(+)} = 0.5$$ we need the maximum amount of information to determine the class.

For attributes (features) have $$c$$ values (i.e. more than 2), the above formula generalizes to

$$
  \mathrm{Entropy}(S) = \sum_{i = 1}^c -p_{i}\log_2 p_{i}
$$



Entropy quantifies the messiness of the data.

# Algorithm

Contstructing the tree

ID3 determines the **information gain** for
each candidate attribute then
selects the one with highest information gain.

Attributes that have been incor-
porated higher in the tree are excluded, so that any given attribute can appear at
most once along any path through the tree.

This process continues for each new
leaf node until either of two conditions is met: (1) every attribute has already been
included along this path through the tree, or (2) the training examples associated
with this leaf node all have the same target attribute value (i.e., their entropy
is zero).


As with other inductive learning methods, ID3 can be characterized as searching a
space of hypotheses for one that fits the training examples.


ID3 in its pure form performs no backtracking in its search. Once it,se-
lects an attribute to test at a particular level in the tree, it never backtracks
to reconsider this choice. Therefore, it is susceptible to the usual risks of
hill-climbing search without backtracking: converging to locally optimal so-
lutions that are not globally optimal.

Below we discuss an extension that adds a form of backtracking
(post-pruning the decision tree).

ID3 can be easily extended to handle noisy training data by mod-
ifying its termination criterion to accept hypotheses that imperfectly fit the
training data.

Roughly speaking, then, the
ID3 search strategy (a) selects in favor of shorter trees over longer ones, and
(b) selects trees that place the attributes with highest information gain closest to
the root.

Approximate inductive bias of ID3: Shorter trees are preferred over larger trees.