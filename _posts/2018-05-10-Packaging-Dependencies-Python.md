---
tags: python
title: Packaging Python Dependencies Using Conda
--- 

For the past few days I've been practicing a bit of Python while [implementing some basic data structures](https://github.com/golubitsky/leetcode/blob/master/src/data_structures), as well as reading about Decision Trees in Tom Mitchell's Machine Learning text (which I'll get to in an upcoming post). After brushing up on [trees](https://github.com/golubitsky/leetcode/blob/master/src/data_structures/binary_tree.py) and [search/traversal algorithms](https://github.com/golubitsky/leetcode/blob/master/src/126_word_ladder_2.py) in general I'm about ready to jump in to implementing the decision tree.

I say "about" because as I'm thinking of how to implement one, I realize I'll probably use Numpy or Pandas to accept input data. In order to do that I need to create a Python project and package its dependencies. I use Conda, so I figured out how to do it with Conda.

As of writing this post, I can start building the decision tree (or any other Python project) in a sandbox Python environment with all dependencies packaged and with automated tests! It's taken me a few extra days to get to this point, with quite a few detours from the goal of learning ML stuff (including [filing what I believe to be a small bug in conda](https://github.com/conda/conda/issues/7279). In the long-term, getting acquainted with Python tooling and developing a functional workflow is worth the time invested. 

## Packaging Dependencies
### Write an `environment.yml` file
Mine looks like this:

{% highlight yaml %}
name: ml-algorithms
dependencies:
- python=3
- numpy
- pytest-xdist # makes pytest -f option available
{% endhighlight %}

We'll use Python 3 and have `numpy`, and `pytest-xdist` [for testing]({{ "/2018/05/06/TDD-In-Python" | relative_url }}).

### Create the conda env

Running `conda env create` in the same directory as the above `environment.yml` file will create a conda environment named `ml-algorithm`. Here's [a link](https://conda.io/docs/user-guide/tasks/manage-environments.html) more info on managing environments with conda.

### Ensure Tests Run In Correct Environment

After going through the above steps I performed this sanity check: I wrote a test that imported Pandas -- which should _not_ be available. To my surprise the test did _not_ fail. I learned that in order to run Pytest with the current version of Python rather than the system version we have to run it as a script by using `python -m pytest` rather than `pytest` as our command. Running Pytest as a script resolved this issue, and now the test that imported the non-existent Pandas package _was_ failing.

## Optimization

Having worked with [RVM](https://rvm.io) in the Ruby world I was used to [automatically switching environments](https://rvm.io/workflow/projects#rvm-configuration) using the `rvm_autoinstall_bundler_flag` when entering a directory that specified one. I wanted a lightweight solution to automatically change Conda envs in a similar way, but found that no off-the-shelf solution seemed to exist. I found [this script](https://github.com/chdoig/conda-auto-env) and [modified it slightly](https://github.com/golubitsky/dotfiles#conda_auto_envsh) to function similarly to how RVM does: switch to an environment if there's an `environment.yml` file and otherwise use the `base` environment. Switching to the `base` environment is cheap enough, so in the `.bashrc` file I modified the `cd` command to do this silently for all directories without an `environment.yml` (as well as to, using the script, switch into the environment if it exists):

{% highlight bash %}
  source ~/.cfg/conda_auto_env.sh

  function cd () {
      builtin cd "$@"    # perform the actual cd
      conda_auto_env
  }
{% endhighlight %}