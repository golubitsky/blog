---
tags: music
title: '"Drop 2" Voicings'
---

In the [previous post]({{ "/2021/01/05/The-Buddhist-Tradition" | relative_url }}) I summarized a voicing that sounded good.

Today, I recognized that I had in a way re-invented the wheel. I had been thinking of this voicing as:

- start on any 7th chord tone as the lowest voice and proceed up
- skip one chord tone
- add two chord tones in order
- add the skipped chord tone

Well, here's another way to think about this voicing — as always in music, symmetries abound:

- start on any 7th chord tone and proceed _down_
- skip one chord tone
- add two chord tones in order
- add the skipped chord tone

Both of these algorithms arrive at the same result. The difference is that the latter has a common name: the so-called [Drop-2 Voicing](<https://en.wikipedia.org/wiki/Voicing_(music)#Drop_voicings>). "2" because it's the second voice from the top and "drop" because it is dropped an octave. Fair enough. I might still continue to think of it in my system, because it's more interesting to think of what the chord is built on top of.

# 2-5-1 "Drop 2" Voicings

In each of the algorithms above, which both arrive at the same result, we can start on any chord tone. There are 4 chord tones in a 7th chord. The one for "Third in the bass" is reproduced from the previous post, except I've removed the `b9` from the `V`, so as to accentuate the symmetries in voice leading. I'll also generalize and use a generic `ii` chord — i.e. not calling out a specific `b5`, because the voicing pattern can be generalized to 2-5-1s of any quality.

Arrows (`-->`) indicate pitch changes.

## Symmetries abound

Note as always that when going round the circle of fifths:

- 1 becomes 5; 5 becomes 1.
- 3 becomes 7; 7 becomes 3.

In the smoothest voice leading:

1. One voice from each pair (i.e. `1 and 5` and `3 and 7`) moves **down**, while the other stays.
2. Then, the voices that have just moved stay. The other voices move **down**.

<!-- TODO: comment on moving intervals for the moving voices -->

## Root in the bass

<style>
  .voicing-table-container {display: flex; flex-direction: row;}
  .voicing-table {flex-grow: 1}
</style>

<div class="voicing-table-container">
<!-- Left -->
<div class="voicing-table">
<b>Voices</b>

<pre>
S     3       7 ----> 3
A     7 ----> 3       7
T     5 ----> 1       5
B     1       5 ----> 1

     ii       V       I
</pre>
</div>
<!-- Left -->

<!-- Right -->
<div class="voicing-table">

<b>Intervals</b>

<pre>
4       5       4
3       3       3
5       4       5


ii      V       I
</pre>
</div>
<!-- Right -->
</div>

## Third in the bass

<div class="voicing-table-container">
<!-- Left -->
<div class="voicing-table">
<b>Voices</b>

<pre>
S     5 ----> 1       5
A     1       5 ----> 1
T     7 ----> 3       7
B     3       7 ----> 3

     ii       V       I
</pre>
</div>
<!-- Left -->

<!-- Right -->
<div class="voicing-table">

<b>Intervals</b>

<pre>
5       4       5
2       3       2
5       4       5


ii      V       I
</pre>
</div>
<!-- Right -->
</div>

## Fifth in the bass

<div class="voicing-table-container">
<!-- Left -->
<div class="voicing-table">
<b>Voices</b>

<pre>
S     7 ----> 3       7
A     3       7 ----> 3
T     1       5 ----> 1
B     5 ----> 1       5

     ii       V       I
</pre>
</div>
<!-- Left -->

<!-- Right -->
<div class="voicing-table">

<b>Intervals</b>

<pre>
5       4       5
3       3       3
4       5       4


ii      V       I
</pre>
</div>
<!-- Right -->
</div>

## Seventh in the bass

<div class="voicing-table-container">
<!-- Left -->
<div class="voicing-table">
<b>Voices</b>

<pre>
S     1       5 ----> 1
A     5 ----> 1       5
T     3       7 ----> 3
B     7 ----> 3       7

     ii       V       I
</pre>
</div>
<!-- Left -->

<!-- Right -->
<div class="voicing-table">

<b>Intervals</b>

<pre>
4       5       4
3       2       3
4       5       4


ii      V       I
</pre>
</div>
<!-- Right -->
</div>
