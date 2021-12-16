#!/bin/bash
# Enter in the container with:
# singularity shell qp2_light_v2.cif
git clone https://github.com/QuantumPackage/qp2
cd qp2
source quantum_package.rc
./configure -i all
./configure -c ./config/gfortran_avx.cfg
make
