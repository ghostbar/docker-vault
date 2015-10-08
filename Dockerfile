FROM alpine:latest
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>

ENV VAULT_VERSION=0.3.1
ENV VAULT_ZIP="vault_${VAULT_VERSION}_linux_amd64.zip"
ENV VAULT_SHA256SUMS="vault_${VAULT_VERSION}_SHA256SUMS"

WORKDIR /tmp
RUN apk --update add wget ca-certificates && \
    wget -O /tmp/${VAULT_ZIP} \
      https://dl.bintray.com/mitchellh/vault/${VAULT_ZIP} && \
    wget -O /tmp/${VAULT_SHA256SUMS} \
      https://dl.bintray.com/mitchellh/vault/${VAULT_SHA256SUMS} && \
    sha256sum -c /tmp/${VAULT_SHA256SUMS} 2>&1 | grep "${VAULT_ZIP}: OK" && \
    unzip /tmp/${VAULT_ZIP} -d /usr/local/bin && \
    rm /tmp/${VAULT_ZIP} /tmp/${VAULT_SHA256SUMS} && \
    apk del wget ca-certificates && \
    rm -rf /var/cache/apk/*

EXPOSE 8200

ENTRYPOINT ["/usr/local/bin/vault"]
CMD ["version"]
