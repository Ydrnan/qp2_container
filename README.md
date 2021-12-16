# qp2_container  

Installation of GO:  

  ./go_install.sh  

Installation of singularity:  

  ./singularity_install.sh  

Creation of the container:  

  sudo singularity build qp2_container.cif qp2_container.def  

To enter in the container:  

  singularity shell qp2_container.cif  

Installation of qp2 in the container:  

  chmod +x qp2_install.sh
  ./qp2_install.sh  



