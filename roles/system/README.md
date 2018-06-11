# system

Manages a basic system set up.

## mkinitcpio

If you want to play around with `mkinitcpio`, it's best to do it with a new
`.img` instead of your existing one in case you mess something up (which you
really don't want to do to your boot process).

To create a custom image with a custom configuration:

```sh
$ mkinitcpio -c /etc/mkinitcpio-custom.conf -g /boot/initramfs-linux-custom.img
```

Then create a new bootloader entry, using `initrd /initramfs-linux-custom.img`.

See [Minimal initramfs](https://wiki.archlinux.org/index.php/Minimal_initramfs)
for a guide on how to make a small initramfs.
