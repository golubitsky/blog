---
tags: python decision-trees
title: Towards Decision Trees/TDD In Python
--- 

After running into considerable difficulties in trying to understand how SVM's work I've taken a bit of a step back. I'll come back to SVMs for sure, but incidentally this week I bumped into someone who said "man, you know about neural networks but you don't know decision trees?" So I decided to learn about them. I've also heard that this is one of the more basic algorithms in ML, so implementing it should provide a nice confidence boost (though, as I'm learning, it _does_ build on the notion of [entropy](https://en.wikipedia.org/wiki/Entropy_(information_theory)), so how "basic" is it really?).

In gearing up to implement a decision tree I started to think that while Jupyter notebooks are awesome for quick prototyping, and in a sense _do_ decrease the feedback loop during development, for more complex development (such as in building algorithms) they can quickly get out of hand as you try this, that, and the other thing.

I realized that I'm missing the extensive unit testing capabilities (i.e. [TDD](https://en.wikipedia.org/wiki/Test-driven_development)) I'd grown accustomed to in the C#, Ruby, and Node ecosystems. For example, dotnet uses [dotnet-watch](https://docs.microsoft.com/en-us/aspnet/core/tutorials/dotnet-watch?view=aspnetcore-2.1) for testing dotnetcore projects and [create-react-app uses Jest under the hood](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#running-tests) to watch for changes and execute the tests.

I wanted an off-the-shelf solution to run a single command to automatically test my Python code in the background. I imagined that when I had this solution up and running I'd be able to import the rock-solid TDD'd library into a Jupyter notebook to use it in more elaborate prototyping, data analysis, and building models. I particularly want to be more confident in the lower level details of an ML algorithm as I'm fighting the battle of learning the complex maths its built on. 

There are numerous potential solutions offered via Stack Overflow for how to TDD in Python. I chose the one that seemed the simplest to use and was relatively recently maintained: [pytest](https://docs.pytest.org/en/latest/).

# TDD Solution

I built this [skeleton project](https://github.com/golubitsky/python-skeleton) for writing Python in a TDD fashion.

Now I can build new Python packages and know exactly where to put new test files and how to run them seamlessly in the background -- I'm ready to start working on implementing a decision tree!