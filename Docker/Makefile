IMAGE = qp2_contanier

default:
	docker build -t $(IMAGE) .

no-cache:
	docker build -t $(IMAGE) --no-cache .

image-clean:
	docker image rm --force $(IMAGE)

clean: image-clean
