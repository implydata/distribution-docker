FROM ubuntu:14.04

# Prepare OS
COPY setup-os.sh /root
COPY nodesource-pubkey /root/nodesource-pubkey
RUN /root/setup-os.sh

# Copy package from build directory
ARG implyversion
COPY imply-$implyversion /root/imply-${implyversion}

EXPOSE 1527 2181 8081 8082 8083 8090 8091 8100 8101 8102 8103 8104 8105 8106 8107 8108 8109 8110 8200 9095

WORKDIR /root/imply-$implyversion

CMD ["bin/supervise", "-c", "conf/supervise/quickstart.conf"]
