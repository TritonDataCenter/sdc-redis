<!--
    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
-->

<!--
    Copyright (c) 2014, Joyent, Inc.
-->

# SDC Redis Zone

- Repository: <git@git.joyent.com:redis.git>, <https://mo.joyent.com/redis>
- Who: Josh, Trent
- Docs: <https://mo.joyent.com/docs/redis>
- Tickets/bugs: <https://devhub.joyent.com/jira/browse/HEAD>
- CI builds: <https://jenkins.joyent.us/job/redis>,
  <https://bits.joyent.us/builds/redis/>


This repo is responsible for building the fs-tarball for the SmartDataCenter
(SDC) "redis" zone. See the docs for more details.


# Building

    git clone git@git.joyent.com:redis.git
    cd redis
    make release

