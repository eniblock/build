# build images

Build images, to be used in gitlab-ci

# Available images

## docker

A docker image to build docker images. It comes with several scripts to ease the build of docker images:

* `build`
* `build_with_pipeline_id`
* `build_with_helm_tag`

The repository to use is `registry.gitlab.com/the-blockchain-xdev/xdev-product/build-images/docker:1.1.0`

## helm

A docker image to build helm packages. It comes with a `build` script to ease the build of helm packages.

The repository to use is `registry.gitlab.com/the-blockchain-xdev/xdev-product/build-images/helm:1.1.0`

## deploy

A docker image to run the deployments.

The repository to use is `registry.gitlab.com/the-blockchain-xdev/xdev-product/build-images/deploy:1.1.0`
