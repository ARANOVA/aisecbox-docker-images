#!/bin/bash
# Script to build and push the secure kingfisher image for AiSecBox

# Configuration
KINGFISHER_TAG="v1.99.0" # Default to the latest stable version
DOCKER_USERNAME="aisecbox"

# Check if a version was provided as argument
if [ ! -z "$1" ]; then
    KINGFISHER_TAG="$1"
fi

if [ ! -z "$2" ]; then
    DOCKER_USERNAME="$2"
fi
IMAGE_NAME="${DOCKER_USERNAME}/kingfisher"

echo "🚀 Building multi-arch image ($IMAGE_NAME:$KINGFISHER_TAG) for linux/amd64 and linux/arm64..."

# Ensure we are using a builder that supports multi-arch
docker buildx create --use --name aisecbox-builder 2>/dev/null || docker buildx use aisecbox-builder

# Build and push directly (buildx handles the tagging and multi-platform manifest)
docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg KINGFISHER_VERSION=$KINGFISHER_TAG \
    -t $IMAGE_NAME:$KINGFISHER_TAG \
    -t $IMAGE_NAME:latest \
    -f Dockerfile \
    --push .

echo ""
echo "✅ Multi-arch Build and Push complete:"
echo "  - $IMAGE_NAME:$KINGFISHER_TAG (amd64 + arm64)"
echo "  - $IMAGE_NAME:latest (amd64 + arm64)"

