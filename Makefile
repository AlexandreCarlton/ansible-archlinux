
PLAYBOOK := lenovo-e420.yml

lint:
	ansible-lint $(PLAYBOOK)
.PHONY: lint

test:
	docker build \
		--tag=alexandrecarlton/ansible-archlinux \
		.
	docker run \
		--name=archlinux-ansible-test \
		--rm \
		--tty \
		--volume=$(shell pwd):/ansible \
		--workdir /ansible \
		alexandrecarlton/ansible-archlinux \
		ansible-playbook $(PLAYBOOK)
.PHONY: test
