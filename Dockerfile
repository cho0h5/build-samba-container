FROM alpine:3.21

ENV SMB_USERNAME=
ENV SMB_USERPASSWD=

RUN apk add --no-cache samba-server samba-common-tools

VOLUME ["/samba/data"]

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 445

ENTRYPOINT ["/docker-entrypoint.sh"]
