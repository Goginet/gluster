
# Author: Georgy Shapchits <georgy.schapchits@synesis.ru>

AUTH=goginet
NAME=gluster
TAG=${AUTH}/${NAME}
MASTER_CONTAINER_NAME=gluster-master-1

up:
	hyper compose up -d

down:
	hyper compose down

run:
	hyper exec -it $(MASTER_CONTAINER_NAME) run

connect:
	hyper exec -it $(MASTER_CONTAINER_NAME) bash

build:
	docker build -t $(TAG) .
	docker push $(TAG)
	hyper pull $(TAG)

rebuild: build up
