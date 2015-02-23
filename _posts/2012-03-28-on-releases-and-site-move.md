---
title: On releases and site move
author: w00t
layout: post
---

As some of you will probably have noticed, inspircd.org has been down for quite
a while now. We don't know when (or if) it will be back, which isn't an
acceptable situation for a project to be in, so we have been working slowly to
migrate resources over to [GitHub](https://github.com/inspircd/) as time
permits.

This obviously involves some changes and reorganisation both in what content we
host (there are no forums) and how we host it (we don't do any self-hosting now,
meaning there's a lot less for our small team to maintain), so we'd like to ask
that you bear with us in the meantime, and (if you've some time to spare), that
you help us with putting useful content on the new wiki etc on GitHub. We also
accept pull requests against the site itself, and our site master SaberUK will
be happy to review them.

As for releases, we are aware of a [CERT
vulnerability](http://www.kb.cert.org/vuls/id/212651) against InspIRCd, and are
working to address this. We have some changes in Git to help mitigate this attack,
and are working with a few developers to make sure there are no more problems in
this area (again, help welcome). Until we are able to assure that there are no
more problems, we will not be issuing a release - but obviously, we hope to push
releases out as soon as possible.

In the meantime, we advise you to build InspIRCd from git, or set
&lt;performance:nouserdns&gt; to yes to disable DNS resolution if you are unable to
upgrade at this time.
