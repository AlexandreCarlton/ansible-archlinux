#!/bin/sh
if [ ! -d .venv ]; then
  python3 -m venv .venv
  .venv/bin/pip install molecule molecule-docker
fi

. .venv/bin/activate
PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule test --destroy=never -- -v
