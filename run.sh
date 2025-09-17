#!/bin/bash

export UID=$(id -u)
export GID=$(id -g)

xhost +local:docker

if command -v nvidia-smi &>/dev/null; then
  echo "🚀 Starting with NVIDIA GPU support"
  COMPOSE_BAKE=true docker compose -f docker-compose.yml -f docker-compose.nvidia.yml up -d --remove-orphans
else
  echo "🚀 Starting without NVIDIA GPU (Intel/AMD or CPU fallback)"
  COMPOSE_BAKE=true docker compose -f docker-compose.yml up -d --remove-orphans
fi
