#!/usr/bin/bash
docker run -d \
	-p 445:445 \
	--restart=always \
	-v ~/test/ssforklift:/media/ssforklift \
	-v ~/test/youngho:/media/youngho \
	-e SMB_SSFORKLIFT_PASSWORD=mike \
	-e SMB_YOUNGHO_PASSWORD=mike \
	--name samba \
	cho0h5/samba-personal
