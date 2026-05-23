#!/bin/bash

OLD_IMAGE="YOUR_DOCKERHUB_USERNAME/cicd-app:previous"

echo "Rolling back deployment..."

docker stop cicd-container || true
docker rm cicd-container || true

echo "Pulling previous stable image..."

docker pull $OLD_IMAGE

echo "Starting previous stable container..."

docker run -d \
  --name cicd-container \
  -p 5000:5000 \
  $OLD_IMAGE

echo "Rollback Completed Successfully ✅"