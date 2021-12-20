ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION} AS builder

# Timezone for tzdata
ARG tz=Etc/UTC
RUN echo $tz > /etc/timezone && rm -rf /etc/localtime

# Install
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
 git \
 curl \
 musl \
 musl-dev \
 wget \
 python3 \
 gfortran \
 gcc \
 g++ \
 build-essential \
 unzip \
 libopenblas-dev \
 pkg-config \
 m4 \
 htop \
 vim \
 emacs-nox \
 screen \
 tmux \
 less \
 man \
 manpages-posix \
 rsync \
 lsb-release \
 mlocate

RUN ln -s /usr/bin/python3 /usr/bin/python

# Add user and switch to this user
RUN adduser --disabled-password --gecos '' qpuser
USER qpuser
ENV USER=qpuser

# Go to home
WORKDIR /home/qpuser

# Clone qp2
RUN git clone --depth 100 --branch dev https://github.com/QuantumPackage/qp2

# Go to qp2
WORKDIR /home/qpuser/qp2

# Installation of the dependencies & make
RUN ./configure -i all && ./configure -c ./config/gfortran_avx.cfg && make

# To start the qp shell when running
ENTRYPOINT ["./bin/qpsh"]

