FROM alpine:latest
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>

ENV VAULT_VERSION=0.3.1

RUN apk --update add wget ca-certificates && \
    wget -O /tmp/vault.zip \
      https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip /tmp/vault.zip -d /usr/local/bin && \
    rm /tmp/vault.zip && \
    apk del wget ca-certificates && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "/usr/local/bin/vault" ]
