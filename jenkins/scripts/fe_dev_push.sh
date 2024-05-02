#!/bin/bash

IMAGE="cctiv_project"

echo "Login to docker ..."
docker login -u $DOCKER_ACCOUNT -p $DOCKER_PASSWORD

echo "Tagging image ..."
docker tag $IMAGE:$BUILD_TAG $DOCKER_USER/$IMAGE:fe_$BUILD_TAG

echo "Push image ..."
docker push $DOCKER_USER/$IMAGE:fe_$BUILD_TAG
