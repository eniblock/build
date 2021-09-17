# build images

Build images, to be used in gitlab-ci

# Available images

## docker

A docker image to build docker images. It comes with several scripts to ease the build of docker images:

* `build`
* `build_with_pipeline_id`
* `build_with_helm_tag`

The repository to use is `registry.gitlab.com/xdev-tech/build/docker:1.5.0`

## helm

A docker image to build helm packages. It comes with a `build` script to ease the build of helm packages.

The repository to use is `registry.gitlab.com/xdev-tech/build/helm:1.5.0`

### Generated kubeval schemas

Install `openapi2jsonschema` with `pip install openapi2jsonschema`.

Connect to a kubernetes cluster and expose its API with

```
kubectl proxy --port=8080
```
and run

~~~
openapi2jsonschema http://localhost:8080/openapi/v2 -o helm/master-standalone-strict --stand-alone --strict --kubernetes --expanded
~~~

## deploy

A docker image to run the deployments.

The repository to use is `registry.gitlab.com/xdev-tech/build/deploy:1.5.0`
