# ansible-archlinux

[![Build Status](https://travis-ci.org/AlexandreCarlton/ansible-archlinux.svg?branch=master)](https://travis-ci.org/AlexandreCarlton/ansible-archlinux)

Reproduces my machine (ArchLinux) from scratch so I can re-deploy to new machines.

```bash
ansible-playbook lenovo-e420.yml --ask-become-pass
```

Several roles also come with their own documentation:

 - [`snapper`](roles/snapper)
 - [`thinkpad`](roles/thinkpad)
