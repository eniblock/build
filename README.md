# Build

Common stuffs to build other stuffs

## Earthly

Some reusable code to import in your projects.

### helm

Helper commands to lint, build and publish helm packages in earthly.

### terraform

Helper commands to apply terraform configuration in earthly.

### deploy

Helper commands to deploy a helm chart in earthly.

## Actions

### setup

A setup action that:

* checks out the code
* login the relevant repositories
* configure earthly
* generate a tag to be used in the generated artifacts

It accepts several inputs:

* `helmdir`: Directory of the helm chart to publish. It is used to grab the currently built version and build the artifact tag from that. If not provided, the generated tag does not include a version, just the current ref name and build id.
* `dockerhub_token`: The dockerhub token to use.
* `default_earthly_cache`: If true, configure some earthly environment variable with a reasonable default for most build. Set it explicitly to false if the default is not good enough for your cas.
* `fetch-depth`: The git fetch depth. Defaults to `1` for performance reason, but can be set to any other value if the job needs some history. Use `-1` to get the whole history.
* `raw_version_on_branch`: Just use the version from the helm chart for this branch. Useful to deploy from a specific tag for example.
