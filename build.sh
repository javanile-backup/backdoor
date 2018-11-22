#!/bin/bash

docker-compose down --remove-orphans
docker-compose build
git commit -am "build"
git push
