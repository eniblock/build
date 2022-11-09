#!/bin/bash

set -eu

COMMIT_REF_SLUG="${CI_GITHUB_REF_NAME_SLUG//_/-}" # generated using rlespinasse/slugify-value@v1.x
PIPELINE_ID="${GITHUB_RUN_NUMBER}"
if echo "${GITHUB_REF}"|grep -q 'refs/tags/'
then
    COMMIT_TAG="${GITHUB_REF_NAME}"
else
    COMMIT_TAG=""
fi


helmdir=$1

if [ -z "$helmdir" ]; then
  if [ -z "$COMMIT_TAG" ]; then
    echo $COMMIT_REF_SLUG.$PIPELINE_ID
  else
    echo $COMMIT_TAG
  fi
else
  version=`cat $helmdir/Chart.yaml|grep '^version:'|tr -d '"' |sed -r 's/^version: *(.+)$/\1/'`
  if [ -z "${version}" ]; then
    cat <<EOF >> /dev/stderr
Could not compute the version of the helm chart in ${helmdir}/Chart.yaml.
Please make sure it contains a line starting with 'version: some.version.number1'
EOF
    exit 1
  fi
  if [ -z "$COMMIT_TAG" ]; then
    version=$version-$COMMIT_REF_SLUG
    echo $version.$PIPELINE_ID
  else
    if [ "$version" != "$COMMIT_TAG" ]; then
      echo Chart version and tag mismatch: "$version" vs "$COMMIT_TAG" >> /dev/stderr
      exit 1
    fi
    echo $version
  fi
fi
