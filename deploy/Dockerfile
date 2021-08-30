FROM gcr.io/google.com/cloudsdktool/cloud-sdk:323.0.0-alpine
RUN apk add \
  bash \
  curl \
  docker \
  docker-compose \
  git \
  openssh-client \
  patch \
  util-linux \
  jq
RUN curl -sL https://github.com/jwilder/dockerize/releases/download/v0.6.1/dockerize-alpine-linux-amd64-v0.6.1.tar.gz | tar xvzC /usr/bin
RUN cd /usr/local/bin \
  && curl https://releases.hashicorp.com/vault/1.5.3/vault_1.5.3_linux_amd64.zip | unzip - \
  && chmod a+x vault
RUN cd /usr/local/bin \
  && curl https://releases.hashicorp.com/terraform/1.0.5/terraform_1.0.5_linux_amd64.zip | unzip - \
  && chmod a+x terraform
RUN curl -sL https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz | tar xvzC /usr/bin --strip-components=1 linux-amd64/helm
RUN curl -fsSL https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl > /usr/local/bin/kubectl \
  && chmod 755 /usr/local/bin/kubectl
RUN curl -fsSL https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.29.0/kbld-linux-amd64 > /usr/local/bin/kbld \
  && chmod 755 /usr/local/bin/kbld
RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64
ADD dockerhublogin /usr/local/bin/
COPY kbldpp init /usr/local/bin
RUN chmod a+x /usr/local/bin/*
ENV HELM_EXPERIMENTAL_OCI=1
