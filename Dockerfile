FROM alpine:3.4

ENV GO15VENDOREXPERIMENT 1
ENV VERSION_HASH 9713146600f3aba055a5bfaf477af2a81dec272e
ENV GOPATH /go
ENV APK_PACKAGES curl git go

ENV PATH $PATH:$GOPATH/bin

RUN apk add -U $APK_PACKAGES && \
    mkdir -p $GOPATH/bin && \
    curl https://glide.sh/get | sh && \
    mkdir -p $GOPATH/src/github.com/coreos && \
    cd $GOPATH/src/github.com/coreos && \
    git clone https://github.com/coreos/aws-auth-proxy && \
    cd aws-auth-proxy && \
    git checkout $VERSION_HASH && \
    glide install && \
    go build -o /usr/local/bin/aws-auth-proxy github.com/coreos/aws-auth-proxy

ENV ES_SCHEME https
ENV SERVICE_NAME es

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
