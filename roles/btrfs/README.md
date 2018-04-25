# btrfs

Sets up configuration for a btrfs system, including:

 - preventing LVM from running
 - snapper set up.

Note that this assumes we have subvolumes mounted at:

 - `/`
 - `/home`

This can be varied via the `btrfs_snapper_configurations` variable.

## Using snapper
This will set up snapper to automatically perform a pre- and post-snapshot of
the root subvolume every time we install or upgrade something with pacman using
`snap-pac`.
