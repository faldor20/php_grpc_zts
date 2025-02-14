#!/bin/bash

echo "Enter php tag for the  debian base php image: "
read tagName
export TAG_NAME=$tagName
echo "building image..."
docker build . -t php_grpc:$TAG_NAME
echo "pushing image..."
docker push php_grpc:$TAG_NAME
