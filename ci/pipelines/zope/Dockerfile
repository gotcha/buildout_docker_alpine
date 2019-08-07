FROM registry:5000/gotcha/buildout-docker-alpine as builder

RUN apk add --no-cache --virtual .build-deps \
  git \
  gcc \
  wget \
  build-base
WORKDIR /zope/instance
COPY buildout.cfg /zope/instance/
COPY buildout-versions.cfg /zope/instance/
RUN buildout -c buildout.cfg

FROM python:2.7-alpine3.9
VOLUME /data
WORKDIR /zope/instance
RUN apk add --no-cache --virtual .run-deps \
  bash \
	netcat-openbsd
RUN addgroup -g 500 zope \
  && adduser -S -D -G zope -u 500 zope -h /zope/instance
COPY --chown=zope --from=builder /zope/instance .
COPY --from=builder /usr/local/lib/python2.7/site-packages /usr/local/lib/python2.7/site-packages
COPY docker-initialize.py docker-entrypoint.sh /

USER zope
EXPOSE 8080

HEALTHCHECK --interval=1m --timeout=5s --start-period=1m \
  CMD nc -z -w5 127.0.0.1 8080 || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]
