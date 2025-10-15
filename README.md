# haproxy-practice

The goal of this project is to create an HAProxy container with three NGINX webserver backends in Podman, using a Kubernetes pod spec-file and use it as an HAProxy playground.

## to bring the pod up
```bash
make up
```

## and to bring the pod down
```bash
make down
```

## to clean up all the images and artifects
```bash
make clean
```
