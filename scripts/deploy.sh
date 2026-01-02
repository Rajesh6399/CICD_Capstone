#!/bin/bash
ENV=$1
IMAGE=myrepo/backend:latest

docker pull $IMAGE

docker stop backend || true
docker rm backend || true

docker run -d \
  --env-file .env.$ENV \
  -p 5000:5000 \
  --name backend \
  $IMAGE

curl -f http://localhost:5000/health || exit 1
