* NEEDS TO MOVE Complement Rule applies if we condition on the same event.

# Conditional Probability
The conditional probability of event $$A$$ given event $$B$$ can be expressed as
\begin{equation}
  P(A|B) = \frac{P(A \cap B)}{P(B)} \tag{1}\label{1}
\end{equation}

The Complement Rule extends to conditional probabilities only when you condition on the same event.


## Independence Checks
Events $$A$$ and $$B$$ are independent iff any one of these 4 checks are true.

\begin{equation}
  P(B | A) = P(B)
\end{equation}

\begin{equation}
  P(A | B) = P(A)
\end{equation}

\begin{equation}
  P(B | A) = P(B | \mathrm{not} \ A)
\end{equation}

\begin{equation}
  P(A \cap B) = P(A) \cdot P(B)
\end{equation}

Note, all 4 equations should be true (or all false) for the same reason that we only need three particular values in a probability table to fill out the rest of the values.

# General Multiplication Rule
This rule is used when two events occur in stages, and the first event impacts the second one, e.g. pulling two cards out of a deck without replacement.

\begin{equation}
  P(A \cap B) = P(A) \cdot P(B | A) \tag{2}\label{2}
\end{equation}

Notes:
* This rule is a reformulation of \eqref{1}
* If $$A$$ and $$B$$ are independent,
$$P(B | A) = P(B)$$.
* Another formulation of this rule would be

\begin{equation}
  P(A \cap B) = P(B) \cdot P(A | B) \tag{3}\label{3}
\end{equation}

# Probability Trees
Probability trees can be used to express conditional probabilities.
* Probabilities in the 1st branch-off are non-conditional.
* Any subsequent branch-offs reflect conditional probabilities. 
* Probabilities of branches from one point always add up to 1.
![Probability Tree Example]({{ site.baseurl }}/assets/2018-02-22-probability-tree.png "Probability Tree Example")

# Law of Total Probability
In a probability tree, we can find the total probability of some event $$B$$ by adding up all of its occurrences via conditional probabilities
\begin{equation}
  P(B) = P(A) \cdot P(B | A) + P(\mathrm{not} \ A) \cdot P(B | \mathrm{not} \ A).
\end{equation}

There are sometimes situations where
* we know the ultimate outcome, and
* want to find the probability that a certain event occurred previously.


# Bayes' Rule https://arbital.com/p/bayes_frequency_diagram/?l=55z&pathId=31343
Bayesian reasoning is about how to revise our beliefs in the light of evidence.

Prior odds * Relative likelihoods = Posterior odds


strength of evidence - how relatively likely different states of the world make our observations


Given a proposition X, P(X) means "the probability of X." X is something that is either true or false, but we are uncertain about it. P(X) expresses the degree of our belief that X is true. P(X|Y) means "the probability of X, assuming Y to be true." The assumption is on the right and the inferred proposition is on the left.