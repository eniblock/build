FROM moby/buildkit:v0.10.4-rootless
USER root
RUN apk add \
  bash \
  docker-cli \
  git \
  sudo \
  curl \
  jq
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64
ADD build_with_helm_tag /usr/local/bin/
ADD build_with_pipeline_id /usr/local/bin/
ADD build /usr/local/bin/
ADD dockerhublogin /usr/local/bin/
RUN chmod a+x /usr/local/bin/*
ENV BUILDKITD_FLAGS=--oci-worker-no-process-sandbox \
  BUILD_CACHE=true
USER user:user
