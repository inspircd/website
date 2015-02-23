---
title: InspIRCd v1.2.9rc1 released!
author: w00t
layout: post
---

InspIRCd 1.2.9rc1 released!

InspIRCd 1.2.9rc1 has been released. Networks running the 1.2 branch are
advised to upgrade immediately; as it fixes a number of potentially
serious issues, including the recent CERT DNS vulnerability. Please
note that, unless severe issues are found in the future or a new
maintainer found, 1.2.9 will be the final release in the 1.2 series.
If you are interested in maintaining it, please get in contact, or start to consider upgrading to 2.0.

Tarballs may be found [at the usual
place](https://github.com/inspircd/inspircd/releases).

Thanks to the following people for their contributions to this release:

    Author: Adam &lt;Adam@anope.org&gt;
    Author: Daniel De Graaf &lt;danieldg@inspircd.org&gt;
    Author: Jackmcbarn &lt;jackmcbarn@jackmcbarn.no-ip.org&gt;
    Author: Kyle Fuller &lt;inbox@kylefuller.co.uk&gt;
    Author: Peter Powell &lt;petpow@saberuk.com&gt;
    Author: Pogs McPoggerson &lt;sir.pogsalot@gmail.com&gt;
    Author: Robin Burchell &lt;viroteck@viroteck.net&gt;
    Author: Shawn Smith &lt;ShawnSmith0828@gmail.com&gt;
    Author: William Pitcock &lt;nenolod@dereferenced.org&gt;

A diffstat is attached:

    README.md                                 |   13 +++++++
    conf/inspircd.conf.example                |    2 +
    conf/inspircd.motd.example                |    1 -
    configure                                 |   12 +++++-
    docs/README                               |    1 -
    include/cull_list.h                       |    2 +
    include/users.h                           |    6 +++
    make/check_eventfd.cpp                    |    7 +++-
    sources.list                              |    2 +-
    src/commands/cmd_info.cpp                 |   21 ++++++-----
    src/cull_list.cpp                         |   18 +++++++++
    src/dns.cpp                               |   57 +++++++++++++++++++++++------
    src/hashcomp.cpp                          |    2 +-
    src/inspircd.cpp                          |    4 +-
    src/modules/extra/m_ssl_gnutls.cpp        |   37 -------------------
    src/modules/m_chghost.cpp                 |   11 +++---
    src/modules/m_hostchange.cpp              |    2 +-
    src/modules/m_nationalchars.cpp           |    3 +-
    src/modules/m_svshold.cpp                 |    2 +-
    src/modules/m_timedbans.cpp               |   50 ++++++++++++++-----------
    src/socketengines/socketengine_kqueue.cpp |    2 +-
    src/users.cpp                             |   12 +++----
    22 files changed, 162 insertions(+), 105 deletions(-)

