---
title:  "Hello MathJax!"
mathjax: true
---
I spent a lot of time getting [Jekyll](https://jekyllrb.com/) to [work with Github pages](https://jekyllrb.com/docs/github-pages/) and [tweaking its default theme](https://github.com/jekyll/minima#customization) -- with the end goal having been driven by wanting to blog about the machine learning book I've started reading -- [An Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/). I wanted to describe a math expression mentioned in that book, and for the description (and the equation) to not look like crap.

In order to achieve this goal, I had to upgrade from the [basic GH-Pages + Jekyll setup](https://github.com/blog/2289-publishing-with-github-pages-now-as-easy-as-1-2-3) to being able to edit my own HTML files, in order to be able to use [MathJax](https://www.mathjax.org/), as per the [instructions here](http://www.gastonsanchez.com/visually-enforced/opinion/2014/02/16/Mathjax-with-jekyll/). In order to do this I followed [the instructions](https://jekyllrb.com/docs/quickstart/#options-for-creating-a-new-site-with-jekyll). The generated `Gemfile` provided instructions for how to switch over to the `github-pages` Gem, which is necessary to deploy the site to gh-pages.  

Finally, it gives me great pleasure to blog that when $$a \ne 0$$, there are two solutions to $$ax^2 + bx + c = 0$$ and they are
  \begin{align\}    
    x = {-b \pm \sqrt{b^2-4ac} \over 2a}
  \end{align\}
!


$$\mathbf{x}_1$$