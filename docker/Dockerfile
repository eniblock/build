FROM moby/buildkit:rootless
USER root
RUN apk add \
  docker-cli \
  git \
  sudo
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ENV BUILDKITD_FLAGS=--oci-worker-no-process-sandbox
ENTRYPOINT [ "sh", "-c" ]
USER user:user
