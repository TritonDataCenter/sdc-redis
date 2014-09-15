<!--
    This Source Code Form is subject to the terms of the Mozilla Public
    License, v. 2.0. If a copy of the MPL was not distributed with this
    file, You can obtain one at http://mozilla.org/MPL/2.0/.
-->

<!--
    Copyright (c) 2014, Joyent, Inc.
-->

# sdc-redis

This repository is part of the Joyent SmartDataCenter project (SDC).  For
contribution guidelines, issues, and general documentation, visit the main
[SDC](http://github.com/joyent/sdc) project page.

This repo is responsible for building the fs-tarball for the SmartDataCenter
(SDC) "redis" zone. See the docs for more details.


# Building

    git clone git@github.com:joyent/redis.git
    cd redis
    make release


# Operators Guide

This section is intended to give necessary information for diagnosing and
dealing with issues with the "redis" zone in a SmartDataCenter installation.

To find the redis zone(s) use the following. Currently there is only one,
though redis clustering *might* be possible at some point.

    sdc-vmapi /vms?owner_uuid=$(bash /lib/sdc/config.sh -json | json ufds_admin_uuid) \
        | json -H -c "this.tags.smartdc_role=='redis'"

Look at the "redis" service.


## Logs

||**service/path**||**where**||**tail -f**||
||redis||in each "redis" zone||`` sdc-login redis; tail -f /var/log/redis/redis.log ``||
