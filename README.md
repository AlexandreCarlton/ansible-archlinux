# ansible-archlinux
Reproduces my machine (ArchLinux) from scratch so I can re-deploy to new machines.

```bash
ansible-playbook hp-mini-210.yml --connection local --become --ask-become-pass
```

We can also use the `virtual-machine.yml` playbook to provision a vagrant box with
the VirtualBox provider.
