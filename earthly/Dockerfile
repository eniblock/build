FROM earthly/earthly:v0.6.22
RUN apk add podman yq bash
COPY earthly-entrypoint.sh tag-opts buildtag /usr/bin/
RUN ln -s /usr/bin/earthly-entrypoint.sh /usr/bin/earthly-daemonless
VOLUME /var/lib/containers
VOLUME /workspace
WORKDIR /the/workdir/path /workspace
ENV FORCE_COLOR=1 \
  NO_DOCKER=1
