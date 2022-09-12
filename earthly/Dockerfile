FROM earthly/earthly:v0.6.23
RUN apk add podman yq bash
COPY earthly-entrypoint.sh tag-opts buildtag /usr/bin/
RUN ln -s /usr/bin/earthly-entrypoint.sh /usr/bin/earthly-daemonless
COPY buildkitd.toml /etc/
VOLUME /var/lib/containers
VOLUME /workspace
WORKDIR /the/workdir/path /workspace
ARG EARTHLY_ADDITIONAL_BUILDKIT_CONFIG
ENV FORCE_COLOR=1 \
  NO_DOCKER=1 \
  EARTHLY_ADDITIONAL_BUILDKIT_CONFIG=$EARTHLY_ADDITIONAL_BUILDKIT_CONFIG
