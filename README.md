# container-samba

## example
### build
``` bash
docker build -t samba .
```

### run
```bash
#!/usr/bin/bash
docker run --rm -d \
	-p 445:445 \
	--restart=unless=stopped \
	-v ~/tmp/nas/data:/samba/data \
	-e SMB_USERNAME=mike \
	-e SMB_USERPASSWD=mike \
	samba
```
