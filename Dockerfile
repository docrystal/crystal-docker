FROM ubuntu:14.04
MAINTAINER docrystal.org <info@docrystal.org>

ENV CRYSTAL_VERSION 0.9.0

RUN apt-get update && \
      apt-get install -y \
      build-essential \
      curl \
      git \
      gzip \
      libbsd-dev \
      libedit-dev \
      libevent-core-2.0-5 \
      libevent-dev \
      libevent-extra-2.0-5 \
      libevent-openssl-2.0-5 \
      libevent-pthreads-2.0-5 \
      libgc-dev \
      libgmp-dev \
      libgmpxx4ldbl \
      libpcl1-dev \
      libreadline-dev \
      libssl-dev \
      libxml2-dev \
      libyaml-dev \
      tar

RUN curl -L -o /tmp/crystal-${CRYSTAL_VERSION}.tar.gz https://github.com/manastech/crystal/releases/download/${CRYSTAL_VERSION}/crystal-${CRYSTAL_VERSION}-1-linux-x86_64.tar.gz && \
      mkdir -p /usr/src/crystal && \
      tar xvzf /tmp/crystal-${CRYSTAL_VERSION}.tar.gz -C /usr/src/crystal && \
      rm /tmp/crystal-${CRYSTAL_VERSION}.tar.gz && \
      ln -s /usr/src/crystal/crystal-${CRYSTAL_VERSION}-1/bin/crystal /usr/local/bin/crystal

CMD [ "/bin/bash" ]
