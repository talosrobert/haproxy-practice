.PHONY: up down clean

clean:
	podman image prune; \
	podman system prune -af

up:
	cat deploy/*yaml | podman kube play -

down:
	cat deploy/*yaml | podman kube down -
