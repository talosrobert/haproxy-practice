ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
.PHONY: up up-haproxy up-nginx down clean

clean:
	podman image prune; \
	podman system prune -af

up-nginx:
	podman container run -d --replace --cpus 1 -m=512m --name web1 --network podman1 nginx:stable-alpine

up-haproxy:
	podman container run -d --replace --cpus 2 -m=1g --name lb --network podman1 \
	-v $(ROOT_DIR)/lb:/usr/local/etc/haproxy:Z,copy -p 8181:8181,8282:8282,8383:8383 \
	-e HTTPLOG_JSON="%{+json}o %(client_ip)ci %(client_port)cp %(request_date)tr %(fe_name_transport)ft %(be_name)b %(server_name)s %(time_request)TR %(time_wait)Tw %(time_connect)Tc %(time_response)Tr/%(time_active)Ta %(status_code)ST %(bytes_read)B %(captured_request_cookie)CC %(captured_response_cookie)CS %(termination_state_cookie)tsc %(actconn)ac %(feconn)fc %(beconn)bc %(srv_conn)sc %(retries)rc %(srv_queue)sq %(backend_queue)bq %(captured_request_headers)hr %(captured_response_headers)hs %(http_request){+Q}r" \
	haproxy:lts-alpine

up: up-nginx up-haproxy

down:
	podman container stop lb web1; \
	podman container rm lb web1
