FROM ubuntu:latest as downloader
RUN apt-get update
RUN apt-get install -y wget tar
RUN wget https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz
RUN tar -zxvf ./helm-v3.7.2-linux-amd64.tar.gz

FROM ubuntu:latest
WORKDIR /workspace
ENV PATH="/workspace:${PATH}"
COPY --from=downloader /linux-amd64/helm .
RUN apt-get update && \
  apt-get install -y wget git && \
  helm plugin install https://github.com/chartmuseum/helm-push.git