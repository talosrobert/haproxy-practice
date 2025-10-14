.PHONY: build up down clean

build:
	podman build -t lb -f Containerfile ./lb; \
	podman build -t web -f Containerfile ./web

clean:
	podman image prune; \
	podman system prune -af

up:
	podman kube play pod.yaml

down:
	podman kube down pod.yaml; \
	podman container prune -f
