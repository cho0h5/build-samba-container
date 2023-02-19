FROM ubuntu:jammy

ENV SMB_USERNAME sambatest
ENV SMB_USERPASSWD sambatest

VOLUME ["/samba/data"]
RUN mkdir -p /samba/data

RUN apt update && apt upgrade -y && apt install -y samba

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN service nmbd stop
RUN service smbd stop

EXPOSE 445

ENTRYPOINT ["/docker-entrypoint.sh"]
