FROM ubuntu:jammy

ENV SMB_SSFORKLIFT_PASSOWRD sambatest
ENV SMB_YOUNGHO_PASSWORD sambatest

VOLUME ["/media/ssforklift"]
VOLUME ["/media/youngho"]

RUN apt update && apt upgrade -y && apt install -y samba

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN service nmbd stop
RUN service smbd stop

EXPOSE 445

ENTRYPOINT ["/docker-entrypoint.sh"]
