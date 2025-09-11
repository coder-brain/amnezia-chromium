#!/bin/bash

export UID=$(id -u)
export GID=$(id -g)

xhost +SI:localuser:$USER

if command -v nvidia-smi &>/dev/null; then
  echo "🚀 Starting with NVIDIA GPU support"
  docker compose -f docker-compose.yml -f docker-compose.nvidia.yml up -d --remove-orphans
else
  echo "🚀 Starting without NVIDIA GPU (Intel/AMD or CPU fallback)"
  docker compose -f docker-compose.yml up -d --remove-orphans
fi