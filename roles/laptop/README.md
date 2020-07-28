# Laptop

Utilities to set up laptop, like wireless.

To connect to a wireless network:

```fish
# jump into an interactive prompt
❯ iwctl

# list available devices
❯ iwctl device list

# scan devices
❯ iwctl station <DEVICE> scan

# list found networks
❯ iwctl station <DEVICE> get-networks

# connect to a found network
❯ iwctl station <DEVICE> connect SSID
```
