FROM alpine:latest as downloader
RUN apk add wget
RUN wget https://get.helm.sh/helm-v3.10.3-linux-amd64.tar.gz
RUN tar -zxvf ./helm-v3.10.3-linux-amd64.tar.gz
COPY ./oc-4.11.22-linux.tar.gz .
RUN tar -zxvf ./oc-4.11.22-linux.tar.gz

FROM ubuntu:latest
WORKDIR /workspace
COPY --from=downloader /linux-amd64/helm /usr/local/bin
COPY --from=downloader /kubectl /usr/local/bin
COPY --from=downloader /oc /usr/local/bin
RUN apt-get update && \
  apt-get install -y wget git curl && \
  helm plugin install https://github.com/chartmuseum/helm-push.git