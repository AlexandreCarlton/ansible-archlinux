
PLAYBOOK := lenovo-e420.yml

lint:
	ansible-lint $(PLAYBOOK)
.PHONY: lint

test:
	docker build \
		--tag=alexandrecarlton/ansible-archlinux \
		.
	docker run \
		--detach \
		--name=archlinux-ansible-test \
		--rm \
		--tty \
		--volume=$(shell pwd):/ansible \
		--volume=/sys/fs/cgroup:/sys/fs/cgroup:ro \
		--workdir /ansible \
			alexandrecarlton/ansible-archlinux
	# Afford it time to start up
	sleep 15
	docker exec \
		--tty \
		archlinux-ansible-test \
		ansible-playbook $(PLAYBOOK)
	docker kill archlinux-ansible-test
.PHONY: test
