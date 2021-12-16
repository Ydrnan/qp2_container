#!/bin/bash

# install singularity
export VERSION=3.9.0-rc.3
if [ ! -f singularity-ce-${VERSION}.tar.gz ]
then
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz
fi
tar -xzf singularity-ce-${VERSION}.tar.gz
cd singularity-ce-${VERSION}
./mconfig && \
    make -C builddir && \
    sudo make -C builddir install
