---
title: Testers wanted
author: Sadie
layout: post
---

The third development snapshot of v5 was tagged today. This release brings some major changes including:

* Modules and extensions being switched from `reference<>` and raw pointers to `std::shared_ptr<>`.

* Unification of how module services (e.g. commands, modes, etc) are registered with the core.

* A redesign of how IRC case-insensitive strings are hashed and compared to be more robust and work with newer C++ features like `std::string_view`.

* A redesign of how server messages are built and emitted to allow future changes to the server protocol wire format.

* Many modules with related behaviour (e.g. `chg*` and `set*`) being merged.

* Many custom numerics and server notices being replaced with IRCv3 standard replies.

As you might imagine such large changes will need a lot of testing and we're looking for volunteers to help out.

<!--more-->

You help by running either v5.0.0dev3 or Git master, testing things which have changed, and reporting any bugs that you find. We are especially interested help with testing on systems other than glibc Linux.

If you can't run your own network the InspIRCd Testnet is now running InspIRCd from Git master and has most modules loaded.

If you're unable to help with testing you can also help by funding InspIRCd's development. InspIRCd is currently maintained entirely by volunteers and every donation helps regardless of amount. For more information please visit [our funding page](https://www.inspircd.org/funding.html).
