# ansible-archlinux

![GitHub Workflow](https://github.com/AlexandreCarlton/ansible-archlinux/actions/workflows/molecule.yml/badge.svg)

Reproduces my machine (ArchLinux) from scratch so I can re-deploy to new machines.

```bash
ansible-playbook lenovo-e420.yml --ask-become-pass
```

Several roles also come with their own documentation:

 - [`optimus`](roles/optimus)
 - [`snapper`](roles/snapper)
 - [`thinkpad`](roles/thinkpad)
