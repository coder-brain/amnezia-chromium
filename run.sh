#!/bin/bash

xhost +local:docker
COMPOSE_BAKE=true docker compose up