---
title: InspIRCd v2.0.6rc1 & v2.1.0b3 released!
author: w00t
layout: post
---

InspIRCd v2.0.6rc1 has been released, fixing the CERT DNS vulnerability, amongst
other things. All v2.0 users are strongly recommended to upgrade. v1.2 users
should start considering the 2.0 branch, as 1.2 is now entering the last phase
of support.

InspIRCd v2.1.0b3 contains some new features:

- a new module for join/part snotices (m_joinpartsno) - useful for smaller
  networks.
- m_redirect offers usermode +L to avoid automated redirections.
- m_sslmodes offers usermode +z to enforce SSL-only queries, matching the
  provided channel mode

Thanks (again) to Shawn Smith for his work on these features.

For v2.0.6rc1, thanks to the following people for this release:

    Author: Adam <Adam@anope.org>
    Author: Daniel De Graaf <danieldg@inspircd.org>
    Author: Jackmcbarn <jackmcbarn@jackmcbarn.no-ip.org>
    Author: Jens Voss <DukePyrolator@anope.org>
    Author: Justasic <Justasic@gmail.com>
    Author: Kyle Fuller <inbox@kylefuller.co.uk>
    Author: Peter Powell <petpow@saberuk.com>
    Author: Pogs McPoggerson <sir.pogsalot@gmail.com>
    Author: Robin Burchell <viroteck@viroteck.net>
    Author: Rutger <djslash+github@djslash.org>
    Author: Shawn Smith <ShawnSmith0828@gmail.com>
    Author: Sir Pogsalot <sir.pogsalot@gmail.com>
    Author: William Pitcock <nenolod@dereferenced.org>

And a diffstat, for the curious:

    README.md                           |   13 ++++++++
    configure                           |   12 ++++++-
    docs/README                         |    1 -
    docs/inspircd.conf.example          |    5 +++
    docs/inspircd.helpop-full.example   |    8 ++--
    docs/inspircd.helpop.example        |    8 ++--
    docs/inspircd.motd.example          |    1 -
    docs/modules.conf.example           |    6 ++--
    docs/modules/modules.conf.charybdis |    2 +-
    include/users.h                     |    4 ++
    make/check_eventfd.cpp              |    7 ++++-
    make/configure.pm                   |   28 ++++-------------
    sources.list                        |    2 +-
    src/commands/cmd_clearcache.cpp     |    2 +-
    src/commands/cmd_info.cpp           |   21 +++++++------
    src/configreader.cpp                |    8 +++--
    src/dns.cpp                         |   57 ++++++++++++++++++++++++++++-------
    src/inspircd.cpp                    |    4 +-
    src/mode.cpp                        |    2 -
    src/modules.cpp                     |    7 ----
    src/modules/extra/m_ssl_gnutls.cpp  |    2 +-
    src/modules/m_blockcolor.cpp        |   10 +++---
    src/modules/m_chghost.cpp           |   11 ++++---
    src/modules/m_hostchange.cpp        |    2 +-
    src/modules/m_nationalchars.cpp     |    3 +-
    src/modules/m_ojoin.cpp             |    2 +-
    src/modules/m_remove.cpp            |    5 +++
    src/modules/m_shun.cpp              |    9 ++++-
    src/modules/m_stripcolor.cpp        |    4 +-
    src/users.cpp                       |   13 +++++---
    win/configure.cpp                   |    2 +-
    31 files changed, 162 insertions(+), 99 deletions(-)

And for v2.1.0b3:

    Author: Adam <Adam@anope.org>
    Author: Daniel De Graaf <danieldg@inspircd.org>
    Author: Jackmcbarn <jackmcbarn@jackmcbarn.no-ip.org>
    Author: Jens Voss <DukePyrolator@anope.org>
    Author: Justasic <Justasic@gmail.com>
    Author: Kyle Fuller <inbox@kylefuller.co.uk>
    Author: Peter Powell <petpow@saberuk.com>
    Author: Pogs McPoggerson <sir.pogsalot@gmail.com>
    Author: Robin Burchell <robin+git@viroteck.net>
    Author: Robin Burchell <viroteck@viroteck.net>
    Author: Shawn Smith <ShawnSmith0828@gmail.com>
    Author: William Pitcock <nenolod@dereferenced.org>
    Author: Xaquseg <xaquseg@irchighway.net>

Diffstat:

    README.md                          |   13 ++++++
    configure                          |   12 +++++-
    docs/README                        |    1 -
    docs/inspircd.conf.example         |    2 +
    docs/inspircd.motd.example         |    1 -
    docs/modules.conf.example          |    7 +++
    make/check_eventfd.cpp             |    7 +++-
    sources.list                       |    2 +-
    src/commands/cmd_clearcache.cpp    |    2 +-
    src/commands/cmd_info.cpp          |    3 +-
    src/dns.cpp                        |   57 ++++++++++++++++++++++-----
    src/inspircd.cpp                   |    4 +-
    src/modules/extra/m_hash_posix.cpp |    2 +-
    src/modules/extra/m_ssl_gnutls.cpp |   32 ++-------------
    src/modules/m_autoop.cpp           |    2 +-
    src/modules/m_chghost.cpp          |   11 +++--
    src/modules/m_ident.cpp            |    1 +
    src/modules/m_joinpartsno.cpp      |   65 ++++++++++++++++++++++++++++++++
    src/modules/m_nationalchars.cpp    |    3 +-
    src/modules/m_redirect.cpp         |   65 +++++++++++++++++++++++++------
    src/modules/m_remove.cpp           |    5 ++
    src/modules/m_shun.cpp             |    9 +++-
    src/modules/m_sslmodes.cpp         |   73 ++++++++++++++++++++++++++++++++++--
    src/users.cpp                      |   19 ++++-----
    24 files changed, 312 insertions(+), 86 deletions(-)
