---
tags: functional-programming
---

I've always been a fan of Rich Hickey, from the first time I heard him talk about how much of a gift it had been to have a year of focused time to work on a new programming language. In an effort to resolve a race condition at write time, I was reading recently about database isolation levels. Along the way I briefly wondered, "how would Datomic [solve this](https://docs.datomic.com/on-prem/acid.html#isolation)? Would it be possible to solve a race condition at read time instead?" Along the way, I bumped into this [fantastic post](http://blog.cognitect.com/blog/2017/4/21/works-on-my-machine-functional-dreams) on Cognitect's blog. I so enjoyed the post that I ordered Russ Olson's Clojure book as soon as I had finished reading it.

Why do I bring this up? I had another small project recently to write a script to transform some data. The notion of this script was: read in a multiline file, transform each line according to a set of rules, write a new file. I ended up with something mostly elegant, but for each of the steps I called Ruby's `map` function:

```ruby
def with_first_rule_applied(line)
  line # apply the rule and return a new line
end

def with_second_rule_applied(line)
  line # apply the rule and return a new line
end
```

My `main` method contained something like this:

```ruby
lines
  .map {|line| with_first_rule_applied(line) }
  .map {|line| with_second_rule_applied(line) }
```

This was fine. The script worked. I had other things to do. But I kept wondering if there was a way to build such a pipeline in a more elegant fashion. It turns out there is! I specifically remembered `function compose(funcs)` from Russ Olson's post above.

## A more functional approach

Let's move to a completely contained example (in Ruby). Say we have some data:

```ruby
data = [1, 2, 3]
```

It needs to be transformed according to some rules -- in this case we will multiply, divide, and add to each value.

```ruby
times_two = ->(x) { x * 2 }
divided_by_two = ->(x) { x / 2 }
plus_ten = ->(x) { x + 10 }
```

This is what we originally had, and it works great:

```ruby
original = data.map { |x| times_two[x] }
               .map { |x| divided_by_two[x] }
               .map { |x| plus_ten[x] }
```

However, we can compose a pipeline that will apply each function in succession:

```ruby
def pipeline_of_maps(*functions)
  proc do |data|
    functions.reduce(data) do |processed_data, function|
      processed_data.map { |datum| function.call(datum) }
    end
  end
end
```

This returns a [proc](https://ruby-doc.org/core-2.6/Proc.html) (that we call `my_first_pipeline`).

```ruby
my_first_pipeline = pipeline_of_maps(
  times_two,
  divided_by_two,
  plus_ten
)
```

The pipeline takes in `data`.

We can see that the two approaches yield the same result:

```ruby
original == my_first_pipeline.call(data)
original == [11, 12, 13]
```
