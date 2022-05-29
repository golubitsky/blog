---
title: "Technical Debt"
tags: programming software
---

For the last several years, I've worked on an inherited microservices system. The team has worked to, over time, in small steps, to eventually radically refactor the core functionality — so that it is much more maintainable from a code-quality perspective. Though it may have been at one point, I do not consider code quality to be a major item of technical debt.

It turns out that not only has the code been inherited, but also, the cultural norms and thought processes — after all, we work within the same organization that made this mess to begin with (though those particular people are no longer with the organization). And that makes solving some of the items below more difficult. The biggest items of technical debt that I see are:

1. For some of our services, we depend on another development team to update the code (at least to merge our pull requests) and to deploy the services. This is a huge waste of time.
2. Our deployment pipelines are not fully automated. In most cases, we have a CI build, but we don't do any CD. I have created a local script for deployment, which I have personally benefited from immensely; as have several new joiners. But I have been unable to convince my lead engineer to invest more into this. My understanding is that this system is designed for longevity — and even if not, it has already been in production for _years_. It's a huge waste of time not to automate deployments.
3. We do not have a reliable feedback mechanism for technical exceptions (errors) in production. For any system deployed in production, we _must_ have awareness of all of our technical exceptions. We have failed if our users have to tell us something is wrong. If building a new system, it is to me inconceivable how to release it in production without the coarsest way of accounting for _all_ the errors in production.
4. Incomplete understanding of domain. We have done a lot on this front, but the nature of the poorly-drawn lines of ownership in the inherited system make it difficult for us to fully understand the domain. The lesson here is to organize teams around clearly-defined concerns within the domain.
