FROM ubuntu:14.04

# Base OS stuff
RUN apt-get update
RUN apt-get -y install --no-install-recommends curl apt-transport-https software-properties-common python python2.7

# Setup sources for Java, Node
COPY nodesource-pubkey /root/nodesource-pubkey
RUN apt-key add /root/nodesource-pubkey
RUN echo "deb https://deb.nodesource.com/node_4.x "$(lsb_release -c -s)" main" > /etc/apt/sources.list.d/nodesource.list
RUN echo "deb-src https://deb.nodesource.com/node_4.x "$(lsb_release -c -s)" main" >> /etc/apt/sources.list.d/nodesource.list
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update

# Install Java
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java8-installer oracle-java8-set-default

# Install Node
RUN apt-get -y install --no-install-recommends nodejs

# Download package
RUN curl http://static.imply.io/release/imply-1.1.0.tar.gz | tar -C /root -xzf -

# Remove stuff we probably don't need, to save on space
RUN apt-get -y remove software-properties-common
RUN apt-get -y autoremove
RUN apt-get -y clean
RUN rm -fr \
  /var/cache/oracle-jdk8-installer \
  /usr/lib/jvm/java-8-oracle/src.zip \
  /usr/lib/jvm/java-8-oracle/javafx-src.zip \
  /usr/lib/jvm/java-8-oracle/lib/visualvm \
  /usr/lib/jvm/java-8-oracle/lib/missioncontrol

EXPOSE 1527
EXPOSE 2181
EXPOSE 8081
EXPOSE 8082
EXPOSE 8083
EXPOSE 8090
EXPOSE 8091
EXPOSE 8100
EXPOSE 8101
EXPOSE 8102
EXPOSE 8103
EXPOSE 8104
EXPOSE 8105
EXPOSE 8106
EXPOSE 8107
EXPOSE 8108
EXPOSE 8109
EXPOSE 8110
EXPOSE 8200
EXPOSE 9095

WORKDIR /root/imply-1.1.0

CMD ["bin/supervise", "-c", "conf/supervise/quickstart.conf"]
