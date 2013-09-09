#!/usr/bin/bash

set -o xtrace
set -o errexit

RELEASE_TARBALL=$1
echo "Building ${RELEASE_TARBALL}"

ROOT=$(pwd)

tmpdir="/tmp/redis.$$"
mkdir -p ${tmpdir}/root/var/svc
mkdir -p ${tmpdir}/root/var/tmp
mkdir -p ${tmpdir}/site

cp ${ROOT}/redis.smf ${tmpdir}/root/var/tmp
cp ${ROOT}/redis-2.4.1.tar.bz2 ${tmpdir}/root/var/svc

mkdir -p ${tmpdir}/root/opt/smartdc/boot
cp -R ${ROOT}/boot/* ${tmpdir}/root/opt/smartdc/boot/
cp -R ${ROOT}/deps/sdc-scripts/* ${tmpdir}/root/opt/smartdc/boot/

mkdir -p ${tmpdir}/root/opt/smartdc/redis
cp -PR ${ROOT}/sapi_manifests ${tmpdir}/root/opt/smartdc/redis

(cd ${tmpdir}; tar -jcf ${ROOT}/${RELEASE_TARBALL} root site)

rm -rf ${tmpdir}
