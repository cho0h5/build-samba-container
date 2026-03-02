# container-samba

## Run

```bash
docker run -d \
    -p 445:445 \
    --restart=unless-stopped \
    -v ~/data:/samba/data \
    -e SMB_USERNAME=myuser \
    -e SMB_USERPASSWD=mypassword \
    --name samba \
    ghcr.io/cho0h5/build-samba-container:main
```

## Environment Variables

| Variable | Description |
|---|---|
| `SMB_USERNAME` | Samba username (required) |
| `SMB_USERPASSWD` | Samba password (required) |
