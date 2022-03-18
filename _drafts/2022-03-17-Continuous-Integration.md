---
tags: tdd unit-testing
---

A few days ago I posted on Linkedin:

> I've been watching some Martin Fowler and Jez Humble videos, and in those videos they lead me to believe that no matter what we say on our team (where we do pull requests and don't merge into master unless all the tests pass for the feature branch builds) we do _not_ do "continuous integration"; and that to really do CI, we'd have to have each team member merging to master multiple times per day.

> My question to anyone who _does_ do CI — does it impact how you work on a feature? For example, there are times when I legitimately work on a feature for a few days — does it mean at the end of each day I should be able to merge my "unfinished" changes into the master branch, even if the feature is not complete?

And I received some amazing responses. I will need to clean this up and form some thoughts of my own!

### Barrett LaFrance - Software Engineer at Defense Unicorns

> [D]oes it impact how you work on a feature?

Yup. It means you'll have to think about HOW to work in addition to what the output should look like... because you'll have to 1) work in small, check-in-able chunks, and 2) you'll have to "hide" your incomplete feature for a while.

If you do TDD, that first part is easy -- you can check in new code (and associated tests) pretty much whenever all your tests are running green.

That second part is a little different-- depending on how large / complex your task is, and how mature your project-or-tooling-or-automation-systems are, that could range anywhere from a simple "just don't add the end user-facing route until final commit" all the way up to "establish system feature toggles to hide whole sections of your system" (and anywhere in between).

### Jason LeGris ✔

Director of Software Craftsmanship. OFFOR Health/SmileMD

"Continuous integration" is a term created in the early 90s by Grady Booch. It did not mean daily. It was xp that used daily meeges - part of it's "turn the dials to 11" philosophy. People fail to realize or remember that kent beck didnt invent CI - he just pushed it ro it's extreme.

### Andrea Laforgia - Software Engineer

It's not correct to say that it did not mean daily. Clearly, we're talking about 1990's, where utilisation of (on premises - no cloud!) server resources was controlled, and virtually no one (especially small companies) was building software continuously. The practice of nightly builds (which is also the one mentioned in XP) was quite common.

Booch, in his book, mentions Continuous Integration with regard to "internal releases" without specifying any interval:

"In general, there may be more internal releases to the development team, with only a few executable releases turned over to external parties. The internal releases represent a sort of continuous integration of the system"

This is open to interpretation and includes the case where you perform multiple internal releases to the development team daily, hourly, every second, etc.

### Andrea Laforgia - Software Engineer

Mikhail Golubitsky Continuous Delivery requires Continuous Integration and Agile requires Continuous Delivery, therefore Agile requires Continuous Integration :)

### Kyle Griffin Aretae - Decoupling - Education - Code - Agile - Math - Philosophy

I will add that this:

https://www.jamesshore.com/v2/blog/2006/continuous-integration-on-a-dollar-a-day

Was something from almost 2 decades ago.

### Marcelo Chiaradia - Software Craftsman

IME yes, it has quite an impact, especially in those cases where you need to introduce disruptive changes(or in your case a "few days work feature") as it's safer to integrate sooner and often instead of waiting til the very end and the inevitable conflicts/merge madness.
Integrating as often as you can makes it safer/easier as it reduces the batch size a lot.

### Mikhail Golubitsky - Software Engineer

That's so interesting — so CI really would require quite a radical departure from our workflow today. Sometimes we have a feature branch out in the wild for a couple weeks even. But, to play devil's advocate, it never feels like we have really terrible "merge madness".

### Andrea Laforgia - Software Engineer

Mikhail Golubitsky >it never feels like we have really terrible "merge madness".

But the danger is there and, believe me, it's gonna manifest itself according to Murphy's Law :)

Imagine two developers working on some code and one deciding to slightly refactoring a class that the other person is incidentally using for their changes. That happens all the time and causes lots of frustration.

The problems with feature branching are less felt in small teams with slow development paces.

### Andrea Laforgia - Software Engineer

Mikhail Golubitsky If you are interested in moving away from the PR mechanism, look at the Ship/Show/Ask approach https://martinfowler.com/articles/ship-show-ask.html

### Javier Lopez - sofware consultant lead en ThoughtWorks

Mikhail Golubitsky I don't think you need to change radically, it's more you have to start thinking in small things, sort them and when that small goal (very small one) is achieved to push it.
I introduced continuous integration in several teams and it's just a question of starting, put some rules like the pipeline cannot be broken and write tests (unit tests are better because they are faster) in every commit.

I wrote about how we changed in a team and we started the road to CI:

https://javi-kata.medium.com/ci-cd-the-journey-of-a-dummy-team-f51a061684bc?sk=f87d2f392581df6e60076f1ca848b77b

### Patrick Conheady - Legal and IT systems that serve people

The question is not "am I doing continuous integration?", but "am I incurring unnecessary integration costs?"

In every project, there is a sweet spot where you are not incurring overheads trying to structure things into micro-commits, but also not wasting time writing lots of code that has to be rewritten in order to merge.

For "extreme programmers" the sweet spot is `test && commit || revert`, while for other programmers the sweet spot is probably daily or at most a few days in a branch. In some projects you could probably get away with a feature branch being out for weeks on end without creating waste, but that would be unusual.

We can all agree that having a distinct "integration" phase in your project plan is a terrible idea. :-)

### Javier Lopez - sofware consultant lead en ThoughtWorks

Yes, this changes how to work. You put the pressure on putting quality when developing.
So in my experience this usually means to be sure that every commit pushed to master is working. This means that the commit does not break any test and is self-tested in the commit.
If you want to do this several times per day that means you have to find a way to hide that small change to the user if is not finished the feature (toggles, branch by abstraction, dark launches)

I tried to explain this here:
https://javi-kata.medium.com/ci-cd-the-developer-perspective-73ae627f435?sk=cb2c2e3f9f0539bda926f00943f11579

### Bryan Finster - Value Stream Architect - Defense Unicorns

“…does it mean at the end of each day I should be able to merge my "unfinished" changes into the master branch, even if the feature is not complete? “

Yes, that’s exactly what it means. Once a day would be that absolute minimum. Multiple times is better. It helps work flow much better and it ensures everyone can see the latest changes. It also helps emphasize testing, improves how the team breaks down work, improves teamwork, reduces waste and helps uncover issues that reduce toil.

https://minimumcd.org/minimumcd/

### Michael Küsters - Thought Provoker

No. Not at the end of each day.

I merge whenever I have a working increment, which sometimes just modifies a single line of code.
On some days, I have like 5 merges, on others maybe 20-30.
I rarely end the day with a merge, more like with a recap of what got done and what I want to do next.

"Feature complete" isn't on my list for deciding when to merge.

And for the record, I use Continuous Deployment. I test on Production.
It does change how you work _significantly._

Moving to CD was the ultimate game changer in my development practice, because it's impossible to "trial and error" a feature if that could break your live server. You move step by step, and in each step ensure that you didn't mess up something somewhere. No commit without quality.
TDD for the win.

### Eugene Baziak - CTO, Pr. Software Engineer at Connexian

I would commit even more than once a day while working on such long feature.
Sometimes it does mean a few days required pause in releases to Production, but mostly I would commit things that are parts of that big task but are not available through UI so user will never reach the feature even if released to Production. Then the final part would be the UI components that grant access to the feature.

### Andrea Laforgia - Software Engineer

Note that feature toggles can be used for UI as well (there are a few React components that wrap other components with feature toggle providers, for example), so the UI changes for a new functionality don’t need to happen after the backend changes.
You can still release feature-toggled vertical slices.

### Chris Ford - Head of Technology at Thoughtworks Spain

My colleague Valentina Servile has a great talk about the effect of continuous deployment (and what you need to get right to make it work). https://www.youtube.com/watch?v=ylVogFl36zM

### Andrea Laforgia - Software Engineer

Yes. See what Javier Lopez suggests.

Not just at the end of each day. You can do it multiple times a day. If you break down your work into manageable chunks of a few minutes each, you can ... guess what? :) integrate into trunk continuously :)

Your commits can be micro-commits: https://www.industriallogic.com/blog/whats-this-about-micro-commits/

The definition of Continuous Integration is "practice of merging all developers' working copies to a shared mainline several times a day", where "shared mainline" means trunk/main/master.

I consider trunk-based development the only proper way of doing CI. Actually, I think those are synonyms: https://www.youtube.com/watch?v=w008iz_UwDk&t=1149s

### Kyle Griffin Aretae - Decoupling - Education - Code - Agile - Math - Philosophy

It absolutely changes how you work on stuff.
It changes how you think about work.
It changes how you build features.

Overall, it's amazing, but ... my new metaphor is that it's like switching hands while doing something physical. Basketball ... switching your shooting hand. Soccer ... switching your shooting foot.
It may take a few months to get good at the new thing.

My ideal world is feature-toggled micro-commits to trunk.

### Walter Nuccio - Big Data Engineer at Agile Lab

"does it impact how you work on a feature?" - finally a good question, thanks!

My answer is yes, it does. When you use branching, you waste a lot of time in things like opening the branch, opening the PR, waiting for the review, and so on. You feel yourself limited in modifying and refactor code that is currently 'owned' by others for fear of the future merge conflicts.
On the contrary, when you work directly on master, you experience a flow, a natural and fluent way of working.

You shall obviously put much more attention to managed incomplete works, as Javier Lopez said, but this is also an incentive to be more accurate and work in small increments, so it has a positive effect eventually.

### Andrea Laforgia - Software Engineer

https://www.devops-research.com/research.html

### Alex Bunardzic - Director of Business Automation at Digital Exprt

The only way to do proper CI is to master the art of vertical slicing of user stories.

### John Siegrist - Enterprise Architect

Yes, it impacts how you work on features. You have to think about what kinds of interactions with the rest of the system might happen with your incomplete changes. You also have to learn to decouple switching the feature on/off from code build and deploy. You also need to think about breaking down changes into smaller pieces.

### Robert John Wilson = Wrangu Co-Founder. Technologist. Leader.

Yes! That is what it means, every day minimum of once. Even if not complete, and once your team gets into the flow of this you will start to see the benefits.
