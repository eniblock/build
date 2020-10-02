FROM alpine
RUN apk add \
  bash \
  curl \
  docker \
  docker-compose \
  git \
  openssh-client \
  util-linux
RUN curl -sL https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz | tar xvzC /usr/bin
RUN cd /usr/local/bin \
  && curl https://releases.hashicorp.com/vault/1.5.3/vault_1.5.3_linux_amd64.zip | unzip - \
  && chmod a+x vault
COPY --from=gcr.io/kaniko-project/executor:debug /kaniko /kaniko
ENV DOCKER_CREDENTIAL_GCR_CONFIG=/kaniko/.config/gcloud/docker_credential_gcr_config.json \
  DOCKER_CONFIG=/kaniko/.docker/ \
  SSL_CERT_DIR=/kaniko/ssl/certs \
  USER=/root \
  HOME=/root
COPY entry-point.sh /
ENTRYPOINT [ "/entry-point.sh" ]
