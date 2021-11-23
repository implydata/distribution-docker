#!/bin/bash -eux

#
# Base OS stuff
#

apt-get update
apt-get -y upgrade
apt-get -y install --no-install-recommends \
                   curl apt-transport-https \
                   python python2.7 perl \
                   software-properties-common gnupg2 jq vim less 


# add Azul's public key
apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9

# download and install the package that adds 
# the Azul APT repository to the list of sources 
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb

# install the package
apt-get install ./zulu-repo_1.0.0-3_all.deb

# update the package sources
apt-get update

apt-get -y install zulu8-jdk


#
# Housekeeping
#

apt-get -y remove software-properties-common 
apt-get -y autoremove
apt-get -y clean
rm -fr /tmp/*
