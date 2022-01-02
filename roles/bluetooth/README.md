# bluetooth

# Quick guide

All commands can be entered interactively in the `bluetoothctl` shell, or as
arguments.

To power on bluetooth (which is kept off by default for security):

    power on

To enable scanning (to pick up new devices; not needed if already paired):

    scan on

To list all available devices (MAC address with description):

    devices

To enable an agent so you can pair:

    agent on

To pair a device:

    pair <mac_address>

To actually connect:

    connect <mac_address>

To disconnect a device after you're done with it (e.g. turn off a PS4
controller):

    disconnect <mac_address>

After having paired a device, you will only need to `power on` and `connect`
that device in future.

# Troubleshooting

# General

For bluetooth speakers, use `pavucontrol` to understand what is recognised and
activating; you may need to set the speakers to be the fallback so that they
activate when connected.

## Zoom

For bluetooth speakers, check that zoom is using it as an audio sink; it might
be using the system speakers instead

# References

 - [bluetooth](https://wiki.archlinux.org/title/bluetooth) (ArchLinux wiki
   entry.)
