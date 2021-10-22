FROM golang:alpine as kube-linter-builder
WORKDIR /app
RUN apk add git make bash patch
# TODO: use official image once https://github.com/stackrox/kube-linter/pull/206 is merged
RUN git clone -b 0.2.3 https://github.com/stackrox/kube-linter.git .
COPY kube-linter.patch ./
RUN patch -p1 < kube-linter.patch
RUN make generated-srcs

FROM golang:alpine as kubeval-builder
WORKDIR /app
RUN apk add git make bash patch
RUN git clone -b 0.16.0 https://github.com/instrumenta/kubeval.git .
COPY kubeval.patch ./
RUN patch -p1 < kubeval.patch
RUN make

FROM alpine
RUN apk add \
  curl \
  docker-cli \
  bat \
  yamllint \
  util-linux
RUN wget -q https://github.com/rancher/k3d/releases/download/v4.4.1/k3d-linux-amd64 -O /usr/local/bin/k3d
RUN wget -q https://dl.k8s.io/release/v1.20.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl
RUN curl -sSL https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz | tar xvzC /usr/local/bin --strip-components=1 linux-amd64/helm
RUN wget -q -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.7.1/yq_linux_amd64
COPY --from=kube-linter-builder /app/bin/linux/kube-linter /usr/local/bin/
COPY --from=kubeval-builder /app/bin/kubeval /usr/local/bin/
COPY master-standalone-strict/ /master-standalone-strict/
COPY kube-linter.yaml /etc/
COPY yamllint.yaml /etc/
ADD build build_std lint /usr/local/bin/
RUN chmod a+x /usr/local/bin/*
ENV HELM_EXPERIMENTAL_OCI=1
WORKDIR /app
