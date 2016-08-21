#!/bin/sh

# TODO: Seems like we don't need this.

cd /home/alexandre/aura-bin
# curl --location --remote-name https://aur.archlinux.org/cgit/aur.git/snapshot/aura-bin.tar.gz
# tar --extract --gzip aura-bin.tar.gz
# cd aura-bin
makepkg -sic --noconfirm
