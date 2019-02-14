IMAGE	?= docker-alpine-jupyter-javascript-typescript

build:

	docker build -t $(IMAGE) .

run:

	docker run -it -p 8888:8888 $(IMAGE)

shell:

	docker run -it --user=root --entrypoint=/bin/sh $(IMAGE)
