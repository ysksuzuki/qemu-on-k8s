FROM quay.io/cybozu/ubuntu-dev:18.04 AS build

# Build bird
ARG BIRD_VERSION=2.0.7
WORKDIR /work

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
       iproute2 \
       flex \
       bison \
       libncurses5-dev \
       libssh-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -s -O ftp://bird.network.cz/pub/bird/bird-${BIRD_VERSION}.tar.gz && \
    tar xzf bird-${BIRD_VERSION}.tar.gz

WORKDIR /work/bird-${BIRD_VERSION}

RUN ./configure \
      --prefix=/usr/local/bird \
      --sysconfdir=/etc/bird \
      --with-runtimedir=/run/bird \
      --with-protocols=bgp,rpki,bfd,pipe,static \
    && make \
    && make install

COPY bird-copyright /usr/local/bird/copyright

# Build chrony
ARG CHRONY_VERSION=3.5.1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sSLf https://download.tuxfamily.org/chrony/chrony-${CHRONY_VERSION}.tar.gz | \
        tar zxf - -C /work/ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work/chrony-${CHRONY_VERSION}
RUN ./configure --exec-prefix=/usr/local/chrony --with-pidfile=/run/chrony/chrony.pid \
    && make \
    && make install \
    && cp ./COPYING /usr/local/chrony/copyright

FROM quay.io/cybozu/ubuntu:18.04

ARG SQUID_VERSION=3.5.27-1ubuntu1.9
ARG DNSMASQ_VERSION=2.79-1

RUN apt-get update \
&& apt-get install -y software-properties-common \
&& add-apt-repository -y ppa:smoser/swtpm \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv 7AD8C79D \
&& add-apt-repository 'deb http://ppa.launchpad.net/projectatomic/ppa/ubuntu bionic main' \
&& apt-get update \
&& apt-get -y install --no-install-recommends \
      git \
      build-essential \
      less \
      wget \
      systemd-container \
      lldpd \
      qemu \
      qemu-kvm \
      socat \
      picocom \
      swtpm \
      cloud-utils \
      xauth \
      bash-completion \
      dbus \
      jq \
      libgpgme11 \
      freeipmi-tools \
      unzip \
      skopeo \
      libdevmapper-dev \
      libgpgme-dev \
      libostree-dev \
      fakeroot \
      btrfs-tools \
      iptables \
      iproute2 \
      time \
      libssh-4 \
      openssh-client \
      squid=${SQUID_VERSION}* \
      dnsmasq-base=${DNSMASQ_VERSION} \
&& rm -rf /var/lib/apt/lists/*

# Config for dnsmasq
EXPOSE 67/udp

VOLUME /var/lib/misc

# Install bird
COPY --from=build /usr/local/bird /usr/local/bird/
COPY --from=build /etc/bird /etc/bird/
COPY --from=build /etc/iproute2 /etc/iproute2/

ENV PATH=/usr/local/bird/sbin:"$PATH"

# Install chrony
COPY --from=build /usr/local/chrony /usr/local/chrony
COPY chrony.conf.example /etc/chrony.conf

VOLUME /var/lib/chrony/

EXPOSE 123/udp

ENV PATH=/usr/local/chrony/bin:"$PATH"

# Install go

ARG GO_VERSION=1.13.8

ENV GOPATH=/go
ENV PATH=/go/bin:/usr/local/go/bin:"$PATH"

RUN curl -s -f -O https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
    && rm -rf /usr/local/go \
    && tar -x -z -C /usr/local -f go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz \
    && mkdir -p /go/src \
    && GOBIN=/usr/local/bin go get golang.org/x/tools/cmd/goimports \
    && GOBIN=/usr/local/bin go get golang.org/x/lint/golint \
    && GOBIN=/usr/local/bin go get honnef.co/go/tools/cmd/staticcheck \
    && GOBIN=/usr/local/bin go get github.com/gordonklaus/ineffassign \
    && GOBIN=/usr/local/bin go get github.com/tcnksm/ghr \
    && GOBIN=/usr/local/bin go get github.com/gostaticanalysis/nilerr/cmd/nilerr \
    && rm -rf /go/src \
    && mkdir -p /go/src
