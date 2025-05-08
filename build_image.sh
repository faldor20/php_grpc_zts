#!/bin/bash

# Prompt for the PHP tag
echo "Enter PHP tag for the debian base PHP image: "
read tagName
export TAG_NAME=$tagName

# Ask if the image should also be tagged as "latest" (default: no)
read -p "Do you want to also tag this image as 'latest'? (y/N) " tagLatest

echo "Building image..."
docker build --build-arg PHP_TAG=$TAG_NAME -t ghcr.io/faldor20/php_grpc_zts:$TAG_NAME .

if [[ "$tagLatest" =~ ^[Yy] ]]; then
  docker tag ghcr.io/faldor20/php_grpc_zts:$TAG_NAME ghcr.io/faldor20/php_grpc_zts:latest
fi

echo "Pushing image..."
docker push ghcr.io/faldor20/php_grpc_zts:$TAG_NAME

if [[ "$tagLatest" =~ ^[Yy] ]]; then
  docker push ghcr.io/faldor20/php_grpc_zts:latest
fi
