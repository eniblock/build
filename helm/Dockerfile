FROM golang:alpine as kube-linter-builder
WORKDIR /app
RUN apk add git make bash
# TODO: use official image once https://github.com/stackrox/kube-linter/pull/202 and
# https://github.com/stackrox/kube-linter/pull/203 are merged
RUN git clone -b xdev https://github.com/glehmann/kube-linter.git .
RUN make generated-srcs

FROM alpine
RUN apk add \
  curl \
  docker-cli
RUN wget https://github.com/rancher/k3d/releases/download/v4.4.1/k3d-linux-amd64 -O /usr/local/bin/k3d
RUN wget https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl
RUN curl -sL https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz | tar xvzC /usr/local/bin --strip-components=1 linux-amd64/helm
RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64
COPY --from=kube-linter-builder /app/bin/linux/kube-linter /usr/local/bin/
COPY kube-linter.yaml /etc/
ADD build lint /usr/local/bin/
RUN chmod a+x /usr/local/bin/*
ENV HELM_EXPERIMENTAL_OCI=1
WORKDIR /app
