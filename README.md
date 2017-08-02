# headless-chrome-node

Docker Hub: https://hub.docker.com/r/jihchi/headless-chrome-node/

```
docker run --cap-add=SYS_ADMIN jihchi/headless-chrome-node node --version
```

Notice! `--cap-add=SYS_ADMIN` is required, otherwise you'll get error message:

```
Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted
```