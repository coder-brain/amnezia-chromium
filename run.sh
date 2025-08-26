#!/bin/bash

export UID=$(id -u)
export GID=$(id -g)

xhost +local:docker
COMPOSE_BAKE=true docker compose up -d
