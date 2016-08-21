# ansible-archlinux
Reproduces my machine (ArchLinux) from scratch so I can re-deploy to new machines.

I could probably have role for individual computers... Hmm..

 - Try to keep it a bit segregated in terms of what archlinux needs and what a
   generic computer needs. Obviously development and desktop are archlinux, but
   rest could be something else (e.g. vagrant stuff).
 - Could we have nested role?
 - We can't just specify the packages since ubuntu need ppas added... Hmm.


```bash
ANSIBLE_NOCOWS=1 ansible-playbook hp-mini-210.yml  --become --ask-become-pass
```

TODO:
make the vars in common global; so we can install as user and w/e.
This means we need to execute common first

Roles:
 - system
   - General filesystem stuff, not specific to a particular user.
 - user (formerlly common)
   - create user
   - dotfiles - one task to pull, one to update, one to deploy.
   - This should go first if we need to deploy stuff later (install locally, etc)
 - archlinux (Our personal one
 - centos (may not want to roll bspwm, just stick with kde)


Could have these, and then have separate files correponding the the distro, and we include when ansible_os_family = 'thing'
 - development
 - desktop

 - vagrant
 - virtualbox
 - laptop
