FROM moby/buildkit:rootless
RUN apk add \
  docker \
  git
USER root
ENV BUILDKITD_FLAGS=--oci-worker-no-process-sandbox
ENTRYPOINT [ "sh", "-c" ]
