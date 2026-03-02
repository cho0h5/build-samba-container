FROM alpine:3.21

ENV SMB_USERNAME=sambatest
ENV SMB_USERPASSWD=sambatest

VOLUME ["/samba/data"]

RUN mkdir -p /samba/data && \
    apk add --no-cache samba-server samba-common-tools

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 445

ENTRYPOINT ["/docker-entrypoint.sh"]
