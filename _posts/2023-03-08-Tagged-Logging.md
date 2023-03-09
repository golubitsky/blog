---
tags: programming logging monitoring observability
---

Tagged logging is an amazing feature when working in monolithic repos. We can use tagged logging to disambiguate logs emitted per

1. Use case — useful when a service handles many use cases, and in particular when a service handles many use cases supported by more than one team — for example, as soon as we start building foos, register the tag `building_foo`, and as soon as we start building bars register the tag `building_bar` — and be careful to include any common error handling inside of that processing (which can be tricky), so that logs emitted during error handling are tagged also
2. Business identifiers — when processing widgets, as soon as a “widget_id” is available, register the tag `widget_id=xyz`

Used together, these two approaches yield significant observability wins (read: decrease time spent sifting through logs, or worse, not understanding our system).

One specific use case we recently solved with this approach was, in a shared monolithic repo, to figure out which errors are attributable to our team (imagine a “generic error x”, which can happen across multiple use cases that serve multiple teams), and which “widgets” those errors affect.

In Ruby on Rails, implemented with [ActiveSupport::TaggedLogging](https://api.rubyonrails.org/classes/ActiveSupport/TaggedLogging.html).
