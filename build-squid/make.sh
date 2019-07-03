#!/bin/bash -e

cd $(dirname $0)
docker run  -it -v $(pwd):/source -v /build  ubuntu:bionic /source/_make.sh

