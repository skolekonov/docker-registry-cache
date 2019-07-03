#!/bin/bash

if [[ "$1" == "" ]]; then
	echo "Usage: $0 ssl_directory cache_directory cfg_file"
	exit 1
fi

SSL_DIRECTORY="$1"
CACHE_DIRECTORY="$2"
CFG_FILE="$3"

docker run -d --restart=always -p 443:443 -p 3128:3128 --name registry-cache \
	-v ${SSL_DIRECTORY}:/etc/ssl/private \
	-v ${CACHE_DIRECTORY}:/cache \
	-v ${CFG_FILE}:/etc/squid/squid.conf \
	registry-cache:latest
