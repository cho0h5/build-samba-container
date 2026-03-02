# container-samba

## Run

### docker run

```bash
docker run -d \
    -p 445:445 \
    --restart=unless-stopped \
    -v ~/data:/samba/data \
    -e SMB_USERNAME=myuser \
    -e SMB_USERPASSWD=mypassword \
    -e SMB_UID=2000 \
    -e SMB_GID=2000 \
    --name samba \
    ghcr.io/cho0h5/build-samba-container:main
```

### docker compose

```bash
cp .env.example .env
# edit .env

docker compose up -d
```

## Environment Variables

| Variable | Description |
|---|---|
| `SMB_USERNAME` | Samba username (required) |
| `SMB_USERPASSWD` | Samba password (required) |
| `SMB_UID` | UID for file ownership (required) |
| `SMB_GID` | GID for file ownership (required) |
| `SMB_PORT` | Host port to expose (docker compose only) |
| `SMB_DATAPATH` | Host path to mount as samba share (docker compose only) |
