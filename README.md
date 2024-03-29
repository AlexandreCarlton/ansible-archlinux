# ansible-archlinux

![GitHub Workflows (molecule.yml)](https://github.com/AlexandreCarlton/ansible-archlinux/actions/workflows/molecule.yml/badge.svg)

Reproduces my machine (ArchLinux) from scratch so I can re-deploy to new machines.

```bash
ansible-playbook lenovo-e420.yml --ask-become-pass
```

Several roles also come with their own documentation:

 - [`bluetooth`](roles/bluetooth)
 - [`optimus`](roles/optimus)
 - [`snapper`](roles/snapper)
 - [`thinkpad`](roles/thinkpad)

# Testing

This uses [Molecule](https://molecule.readthedocs.io/) to test this play as
much as possible within the confines of Docker. Notably, we can't use this to
test:

- btrfs manipulation (e.g. snapper)
- systemd manipulation

This is signified by excluding these roles from being tested, or tagging these
tasks with `notest`.

To test it, run:

    ./run-test.sh

This will spawn a `molecule_pacman_cache` Docker volume to speed up re-runs.
