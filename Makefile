
PLAYBOOK := docker.yml

PLAYBOOK_OPTIONS := -v

lint:
	ansible-lint $(PLAYBOOK)
.PHONY: lint

test:
	docker build \
		--pull \
		--tag=alexandrecarlton/ansible-archlinux \
		.
	# We create these volumes so that we may use systemd within this container.
	# See:
	#  - https://github.com/fedora-cloud/Fedora-Dockerfiles/blob/master/systemd/systemd/Dockerfile
	#  - https://developers.redhat.com/blog/2016/09/13/running-systemd-in-a-non-privileged-container/
	docker run \
		--detach \
		--name=archlinux-ansible-test \
		--rm \
		--tty \
		--mount=type=bind,source=$(shell pwd),destination=/ansible \
		--mount=type=bind,source=/sys/fs/cgroup,destination=/sys/fs/cgroup,readonly \
		--mount=type=tmpfs,tmpfs-size=512M,destination=/run \
		--mount=type=tmpfs,tmpfs-size=256M,destination=/tmp \
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
