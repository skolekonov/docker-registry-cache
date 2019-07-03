#!/bin/bash -e

cd $(dirname $0)

cp build-squid/squid-common*.deb squid-common.deb
cp build-squid/squid_*.deb squid.deb

docker build -t registry-cache:latest .
