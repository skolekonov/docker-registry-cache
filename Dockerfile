FROM ubuntu:bionic

# These must be built with ssl support! Use build-squid to do this...
ADD /squid-common.deb /root/squid-common.deb
ADD /squid.deb /root/squid.deb

RUN apt-get update && apt-get install -y squid libssl1.0.0 && \
    dpkg -i /root/squid-common.deb && dpkg -i /root/squid.deb && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

ADD /_entrypoint.sh /sbin/entrypoint.sh

CMD /sbin/entrypoint.sh
