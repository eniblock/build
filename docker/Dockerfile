FROM alpine:3.12
RUN apk add \
  bash \
  curl \
  docker \
  docker-compose \
  git \
  openssh-client \
  patch \
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
RUN mkdir /usr/lib/docker-kaniko
COPY docker /usr/lib/docker-kaniko/
COPY docker-compose-build-push /usr/local/bin/
COPY docker-compose-no-docker-service.patch /
RUN cd /usr/lib/python3.8/site-packages \
  && patch -p1 < /docker-compose-no-docker-service.patch
ENTRYPOINT [ "/entry-point.sh" ]
