#!/usr/bin/env bash
set -e
DOCKER_FRONTEND_BROWSER="frontend-browser"
DOCKER_SSR_SERVER="ssr-server"
DOCKER_NETWORK="angular-ssr-network"

# build browser nginx
docker build -f conf/Dockerfile --target frontend-browser -t $DOCKER_FRONTEND_BROWSER .
# build server for ssr:
docker build -f conf/Dockerfile --target ssr-server -t $DOCKER_SSR_SERVER .

docker container rm -f $DOCKER_FRONTEND_BROWSER || true
docker container rm -f $DOCKER_SSR_SERVER || true
docker network rm $DOCKER_NETWORK || true
docker network create $DOCKER_NETWORK

docker container run --name $DOCKER_SSR_SERVER --expose 4000 -d --network=$DOCKER_NETWORK $DOCKER_SSR_SERVER
docker container run --name $DOCKER_FRONTEND_BROWSER -p 80:80 -d --network=$DOCKER_NETWORK $DOCKER_FRONTEND_BROWSER
