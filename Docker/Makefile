IMAGE = qp2

default:
	sudo docker build -t $(IMAGE) .

no-cache:
	sudo docker build -t $(IMAGE) --no-cache .

image-clean:
	sudo docker image rm $(IMAGE)

clean: image-clean

test:
	sudo docker run -h qp2 --rm -it $(IMAGE)
