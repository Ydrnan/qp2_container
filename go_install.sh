#!/bin/bash

# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
   build-essential \
   libseccomp-dev \
   pkg-config \
   squashfs-tools \
   cryptsetup

# Check
if [ -d /usr/local/go ]
then
    echo "Delete your directory /usr/local/go before the installation."
    echo "Please run:"
    echo "sudo rm -rf /usr/local/go"
    exit
fi

# install GO
export VERSION=1.17.5 OS=linux ARCH=amd64 

if [ ! -f go$VERSION.$OS-$ARCH.tar.gz ]
then
	wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
fi
sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz 
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc 
source ~/.bashrc

