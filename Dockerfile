FROM alpine:latest

LABEL maintainer "https://github.com/nealhardesty"

ENV USERNAME alpine
ENV PASSWORD thePasswordGoesHere

RUN apk --update add openssh openssh-server sudo && rm -rf /var/cache/apk/* /tmp/*

ADD lib/entrypoint.sh /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
