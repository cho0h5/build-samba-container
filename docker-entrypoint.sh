#!/bin/sh
cat << EOF > /etc/samba/smb.conf
[global]
   server string = %h server (Samba, Ubuntu)
   server role = standalone server
   disable netbios = yes
   smb ports = 445
   log file = /var/log/samba/log.%m
   max log size = 1000

[ssforklift]
   path = /media/ssforklift
   browseable = no
   read only = no
   force create mode = 0600
   force directory mode = 2700
   valid users = ssforklift

[youngho]
   path = /media/youngho
   browseable = no
   read only = no
   force create mode = 0600
   force directory mode = 2700
   valid users = youngho

[public_files]
    path = /tmp
    browsable = yes
    guest ok = yes
    writable = yes
    create mask = 0775
    directory mask = 0755
EOF

addgroup --gid 2000 family

useradd --uid 2000 --no-create-home -s /usr/sbin/nologin -g family ssforklift
useradd --uid 2001 --no-create-home -s /usr/sbin/nologin -g family youngho

chown ssforklift:family /media/ssforklift/
chown youngho:family /media/youngho/

(echo $SMB_SSFORKLIFT_PASSWORD; echo $SMB_SSFORKLIFT_PASSWORD) | smbpasswd -s -a ssforklift
(echo $SMB_YOUNGHO_PASSWORD; echo $SMB_YOUNGHO_PASSWORD) | smbpasswd -s -a youngho

smbpasswd -e ssforklift
smbpasswd -e youngho

service smbd start
while true; do sleep 10000; done
