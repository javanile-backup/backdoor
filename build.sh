#!/bin/bash

##
# javanile/backdoor (v0.0.1)
# Reverse SSH tunnel for Docker
##

docker-compose down --remove-orphans
docker-compose build
docker-compose up

git commit -am "build"
git push
