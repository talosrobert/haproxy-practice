# haproxy-practice

The goal of this project is to create an HAProxy container with three NGINX webserver backends in Podman, using a Kubernetes pod spec-file and use it as an HAProxy playground.

## prepare a podman

Create a network whith name resolutaion and ipv6 enabled.
```bash
podman network create --subnet 3fff:0:0:1::/64 --ipv6 podman1
```

## to bring the containers up
```bash
make up
```

## and to bring the containers down
```bash
make down
```

## to clean up all the images and artifects
```bash
make clean
```
