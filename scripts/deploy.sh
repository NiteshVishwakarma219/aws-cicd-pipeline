#!/bin/bash

IMAGE_NAME="cicd-app"

echo "Stopping old container..."

docker stop cicd-container || true
docker rm cicd-container || true

echo "Pulling latest image..."

docker pull $IMAGE_NAME:latest

echo "Running new container..."

docker run -d \
  --name cicd-container \
  -p 5000:5000 \
  $IMAGE_NAME:latest

echo "Deployment Completed!"