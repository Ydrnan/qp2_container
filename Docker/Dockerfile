# For help about how Dockerfiles work, see https://docs.docker.com/engine/reference/builder
ARG UBUNTU_VERSION=20.04
FROM ubuntu:${UBUNTU_VERSION} AS builder
# Build argument (can be changed at build time
# This argument define timezone for tzdata requierd by qp_run
ARG tz=Etc/UTC
# Install all requierd packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
# Git for download quantum package
git \
# All necessary packages to compile and run quantum package
curl \
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
 lsb-release

RUN ln -s /usr/bin/python3 /usr/bin/python

# Add user and switch to this user
RUN adduser --disabled-password --gecos '' qpuser
USER qpuser

# I don't know why but the USER environment variable is not set so I set it because it's requested for ninja
ENV USER=qpuser

# Go to home
WORKDIR /home/qpuser

# TODO: check branch
# Download quantum package
RUN git clone --depth 100 --branch dev https://github.com/QuantumPackage/qp2

# Go to quantum package
WORKDIR /home/qpuser/qp2

# Configure
RUN ./configure -i all -c config/gfortran_avx.cfg

# source doesn't work with /bin/sh (used by the run command so I use bash)
# Compile the code to a static build
RUN ["/bin/bash", "-c", "source quantum_package.rc ; ninja ; ninja tidy"]

# This image is based from Ubuntu LTS
FROM ubuntu:${UBUNTU_VERSION}
LABEL version="2.1.2" \
maintainer.name="Mickaël Véril" \
quantum_package.author.name="Anthony Scemama" \
quantum_package.url="https://quantumpackage.github.io/qp2" \
quantum_package.repo="https://github.com/QuantumPackage/qp2" \
quantum_package.demo.repo="https://github.com/mveril/qp-demo" \
laboratory.name="Laboratoire de Chimie et Physique Quantique (LCPQ)" \
laboratory.url="http://www.lcpq.ups-tlse.fr/"

# Reconfigure tzdata with the good timezone
RUN echo $tz > /etc/timezone && rm -rf /etc/localtime 

# start a qp shell when run
CMD ["./qp2/bin/qpsh"]


