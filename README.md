# container-samba

## example
### build and publish
``` bash
docker build -t cho0h5/samba .
docker publish cho0h5/samba
```

### run
```bash
#!/usr/bin/bash
docker run -d \
	-p 445:445 \
	--restart=unless-stopped \
	-v ~/tmp/nas/data:/samba/data \
	-e SMB_USERNAME=mike \
	-e SMB_USERPASSWD=mike \
	--name samba \
	samba
```
