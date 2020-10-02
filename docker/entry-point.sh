#!/bin/sh

set -e

if [ -n "$CI_REGISTRY_PASSWORD" ]; then
    echo "Login to $CI_REGISTRY" > /dev/stderr
    docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
fi

exec "$@"
