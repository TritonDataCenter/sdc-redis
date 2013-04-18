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

