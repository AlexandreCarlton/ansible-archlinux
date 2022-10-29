#!/bin/sh
if [ ! -d .venv ]; then
  python3 -m venv .venv
  .venv/bin/pip install "molecule[docker]==4.0.2"
fi

. .venv/bin/activate
ANSIBLE_ROLES_PATH="$(pwd)/roles" PY_COLORS=1 ANSIBLE_FORCE_COLOR=1 molecule test --destroy=never
