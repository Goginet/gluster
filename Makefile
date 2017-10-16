
# Kipod Infrastructure Platform
#
# Authors:
#   Georgy Shapchits <georgy.schapchits@synesis.ru>
#
# Copyright (C) 2016 Synesis LLC. All rights reserved.
AUTH=goginet
NAME=gluster
TAG=${AUTH}/${NAME}

up:
	hyper compose up -d

down:
	hyper compose down

build:
	docker build -t $(TAG) .
	docker push $(TAG)
	hyper pull $(TAG)
