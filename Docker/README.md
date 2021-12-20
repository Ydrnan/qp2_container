# Installation of Docker
``` 
sudo apt install docker.io
```

# To build the container
```
docker build -t qp2_container .
```

# To enter in the container
```
docker run -t -i qp2 bash
```
or 
```
docker run -t -i qp2 /bin/bash
```

# Enter in an excited container
```
docker images --all # to see the differents container, status, names, ...
```
```
docker start TheName  
docker attach TheName
```

# To exit the container 
```
exit
```

# To see the different images
```
docker images
i```

# To delete a image
```
docker image rm NameOfImage
```
or
```
docker image rm --force NameOfImage 
```

# If you have a problem of permission with /var/run/docker.socket
```
sudo chmod 666 /var/run/docker.sock
```

