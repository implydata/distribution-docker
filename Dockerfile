FROM ubuntu:16.04

ARG IMPLY_VERSION
RUN apt-get update && apt-get install -y cron wget && apt-get clean

RUN wget https://static.imply.io/release/imply-$IMPLY_VERSION.tar.gz && \
    tar -xzf /imply-$IMPLY_VERSION.tar.gz && \
    rm /imply-$IMPLY_VERSION.tar.gz && \
    mv imply-$IMPLY_VERSION /root

# Prepare OS
COPY setup-os.sh /root
COPY nodesource-pubkey /root/nodesource-pubkey
RUN /root/setup-os.sh

EXPOSE 1527 2181 8081 8082 8083 8090 8091 8100 8101 8102 8103 8104 8105 8106 8107 8108 8109 8110 8200 9095

WORKDIR /root/imply-$IMPLY_VERSION

CMD ["bin/supervise", "-c", "conf/supervise/quickstart.conf"]
