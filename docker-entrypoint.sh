#!/bin/sh
cat << EOF > /etc/samba/smb.conf
[global]
   server string = %h server (Samba, Ubuntu)
   server role = standalone server
   disable netbios = yes
   smb ports = 445
   log file = /var/log/samba/log.%m
   max log size = 1000

[$SMB_USERNAME]
   path = /samba/data
   browseable = no
   read only = no
   force create mode = 0660
   force directory mode = 2770
   valid users = $SMB_USERNAME
EOF
useradd -d /samba/$SMB_USERNAME/ -s /usr/sbin/nologin -g sambashare $SMB_USERNAME
chown $SMB_USERNAME:sambashare /samba/data/
(echo $SMB_USERPASSWD; echo $SMB_USERPASSWD) | smbpasswd -s -a $SMB_USERNAME
smbpasswd -e $SMB_USERNAME
service smbd start
while true; do sleep 10000; done
