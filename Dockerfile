FROM alpine
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>

ENV GOPATH /opt/go
RUN apk --update add go git && \
    mkdir -p /opt/go && \
    go get github.com/hashicorp/vault && \
    apk del git go && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "/opt/go/bin/vault" ]
