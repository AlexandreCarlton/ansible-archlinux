FROM base/archlinux:latest

RUN pacman \
      --noconfirm \
      --refresh \
      --sync \
      --sysupgrade && \
    pacman \
      --noconfirm \
      --sync \
      ansible \
      systemd \
      systemd-sysvcompat

# USER does not appear to be set properly, yet aura uses this to determine if the user is 'root' (if it is not invoked with sudo).
# systemd likes to know whether it is running in a container, so we set 'container' accordingly.
ENV USER=root \
    container=docker

# We create these volumes so that we may use systemd within this container.
# See the FedoraDockerfiles/systemd/systemd/Dockerfile as a reference.
VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

CMD ["/sbin/init"]
