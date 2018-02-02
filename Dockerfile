FROM base/archlinux:latest

RUN pacman \
      --noconfirm \
      --refresh \
      --sync \
      --sysupgrade && \
    pacman \
      --noconfirm \
      --sync \
      ansible

# USER does not appear to be set properly, yet aura uses this to determine if the user is 'root' (if it is not invoked with sudo).
ENV USER=root
