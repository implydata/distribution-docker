FROM ubuntu:16.04

RUN apt-get update && apt-get install -y cron curl

RUN curl https://static.imply.io/release/imply-$IMPLY_VERSION.tar.gz \
    -H 'Pragma: no-cache' \
    -H 'Accept-Encoding: gzip, deflate, sdch, br' \
    -H 'Accept-Language: en-US,en;q=0.8,fr;q=0.6' \
    -H 'Upgrade-Insecure-Requests: 1' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' \
    -H 'Referer: https://imply.io/download' \
    -H 'Cookie: _ga=GA1.2.481547453.1495186103; _gid=GA1.2.1127559739.1497238768; _gat=1' \
    -H 'Connection: keep-alive' -H 'Cache-Control: no-cache' --compressed > /root/imply-$IMPLY_VERSION.tar.gz

RUN tar -xzf /root/imply-$IMPLY_VERSION.tar.gz

# Prepare OS
COPY setup-os.sh /root
COPY nodesource-pubkey /root/nodesource-pubkey
RUN /root/setup-os.sh

EXPOSE 1527 2181 8081 8082 8083 8090 8091 8100 8101 8102 8103 8104 8105 8106 8107 8108 8109 8110 8200 9095

WORKDIR /root/imply-$IMPLY_VERSION

CMD ["bin/supervise", "-c", "conf/supervise/quickstart.conf"]
