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
ENV USER=root

# We create these volumes so that we may use systemd within this container.
# See the FedoraDockerfiles/systemd/systemd/Dockerfile as a reference.
VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

CMD ["/sbin/init"]
