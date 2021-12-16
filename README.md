# qp2_container  

Installation of GO:  

.. code:: bash
  ./go_install.sh  

Installation of singularity:  

.. code:: bash
  ./singularity_install.sh  

Creation of the container:  

.. code:: bash
  sudo singularity build qp2_container.cif qp2_container.def  

To enter in the container:  

.. code:: bash
  singularity shell qp2_container.cif  

Installation of qp2 in the container:  

.. code:: bash
  ./qp2_install.sh  



