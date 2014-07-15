FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  gettext \
  git-core \
  libgdiplus \
  libtool

RUN git clone https://github.com/mono/mono /tmp/mono \
  && cd /tmp/mono \
  && ./autogen.sh --prefix=/usr --with-mcs-docs=no \
  && make get-monolite-latest \
  && make \
  && make install \
  && cd / \
  && rm -rf /tmp/*

RUN mozroots --import --sync
