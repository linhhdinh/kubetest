#
# trueAnthem nab binary image
#
FROM alpine:3.5

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/v3.5/community/" >> /etc/apk/repositories && \
    rm -rf /var/cache/apk/*

ADD bin/ /usr/local/kubetest/

WORKDIR /usr/local/kubetest

USER nobody

ENTRYPOINT ["./main"]
