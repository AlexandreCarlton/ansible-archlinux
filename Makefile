
PLAYBOOK := docker.yml

PLAYBOOK_OPTIONS := -vvv

lint:
	ansible-lint $(PLAYBOOK)
.PHONY: lint

test:
	docker build \
		--pull \
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
		ansible-playbook $(PLAYBOOK_OPTIONS) $(PLAYBOOK)
	docker kill archlinux-ansible-test
.PHONY: test
