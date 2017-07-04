FROM ubuntu:16.04
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && apt-get install -y python1.5 \
    && cd /tmp \
    && wget http://www.multichain.com/download/multichain-1.0-beta-2.tar.gz \
    && tar -xvzf multichain-1.0-beta-2.tar.gz \
    && cd multichain-1.0-beta-2 \
    && mv multichaind multichain-cli multichain-util /usr/local/bin
ADD bin/nfechain-* /usr/local/bin/
