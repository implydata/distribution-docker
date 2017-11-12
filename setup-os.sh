#!/bin/bash -eu

# Base OS stuff
apt-get update
apt-get -y install --no-install-recommends curl apt-transport-https software-properties-common python python2.7

# Setup sources for Java, Node
apt-key add /root/nodesource-pubkey
echo "deb https://deb.nodesource.com/node_4.x "$(lsb_release -c -s)" main" > /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/node_4.x "$(lsb_release -c -s)" main" >> /etc/apt/sources.list.d/nodesource.list
add-apt-repository ppa:webupd8team/java -y
apt-get update

# Install Java
(echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java8-installer oracle-java8-set-default

# Install Node
apt-get -y install --no-install-recommends nodejs

# Install perl dependencies
apt-get install -y cpanminus
cpanm FindBin

# Remove stuff we probably don't need, to save on space
apt-get -y remove software-properties-common
apt-get -y autoremove
apt-get -y clean
rm -fr \
  /var/cache/oracle-jdk8-installer \
  /usr/lib/jvm/java-8-oracle/src.zip \
  /usr/lib/jvm/java-8-oracle/javafx-src.zip \
  /usr/lib/jvm/java-8-oracle/lib/visualvm \
  /usr/lib/jvm/java-8-oracle/lib/missioncontrol
