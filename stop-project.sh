#!/usr/bin/env bash
set -e
DOCKER_FRONTEND_BROWSER="frontend-browser"
DOCKER_SSR_SERVER="ssr-server"
DOCKER_NETWORK="angular-ssr-network"

docker stop $DOCKER_FRONTEND_BROWSER $DOCKER_SSR_SERVER
docker network rm $DOCKER_NETWORK
