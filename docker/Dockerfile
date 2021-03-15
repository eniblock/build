FROM moby/buildkit:rootless
USER root
RUN apk add \
  docker \
  git
ENV BUILDKITD_FLAGS=--oci-worker-no-process-sandbox
ENTRYPOINT [ "sh", "-c" ]
