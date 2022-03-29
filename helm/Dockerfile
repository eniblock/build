FROM golang:alpine as kubeval-builder
WORKDIR /app
RUN apk add git make bash patch
RUN git clone -b 0.16.0 https://github.com/instrumenta/kubeval.git .
COPY kubeval.patch ./
RUN patch -p1 < kubeval.patch
RUN make

FROM alpine:3.15
RUN apk add \
  bash \
  curl \
  docker-cli \
  bat \
  yamllint \
  util-linux
RUN wget -q https://github.com/rancher/k3d/releases/download/v4.4.1/k3d-linux-amd64 -O /usr/local/bin/k3d
RUN wget -q https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl
RUN curl -sSL https://get.helm.sh/helm-v3.8.1-linux-amd64.tar.gz | tar xvzC /usr/local/bin --strip-components=1 linux-amd64/helm
RUN wget -q -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64
RUN curl -sSL https://github.com/stackrox/kube-linter/releases/download/0.2.5/kube-linter-linux.tar.gz | tar xvzC /usr/local/bin
COPY --from=kubeval-builder /app/bin/kubeval /usr/local/bin/
COPY master-standalone-strict/ /master-standalone-strict/
COPY kube-linter.yaml /etc/
COPY yamllint.yaml /etc/
ADD build build_std lint /usr/local/bin/
RUN chmod a+x /usr/local/bin/*
WORKDIR /app
