# btrfs

Sets up configuration for a `btrfs` system, including:

 - preventing LVM from running
 - setting up `snapper`.

We assume that there is a root subvolume mounted at `/`.
This is configured via the `btrfs_root_subvolume` variable, and defaults to
`@`.

We also rely on the default subvolume being mounted as `/` via

```
$ btrfs subvolume set-default ...
```

This will not be set in `/etc/fstab`, to allow us to change the what we will
mount on the next boot with a command (instead of fiddling with the file).

We also assume that our machine is using full-disk encryption.
The device used is configurable via `btrfs_root_device`, and defaults to
`/dev/mapper/cryptroot`.


## Using snapper
This will set up snapper to automatically perform a pre- and post-snapshot of
the root subvolume every time we install or upgrade something with `pacman`
using `snap-pac`.

The following guides serves as a minor form of documentation since I had to
cobble this together from multiple sources.


### Rolling back to a known good snapshot
Snapshots are enumerated and can be found with `/.snapshots/<num>/snapshot`.
If you need to boot into a previous snapshot, then you change the `rootflags`
parameter at boot to:

```
... rootflags=subvol=@/.snapshots/<num>/snapshot ...
```

where `@` is the subvolume mounted at `/`.

It is important to note that `@/.snapshots` is a subvolume of `@`, so snapper
would normally lose access to its other snapshots.
To resolve this, we explicitly mount this in `/etc/fstab` (done as part of this
role).

We then rollback to this current, good snapshot:

```
sudo snapper rollback
```

This will:

 - create a read-only snapshot of the older broken one (which caused us to
   reboot into a known good snapshot).
 - create a read-write snapshot of the current read-only "good" snapshot.
 - set this new read-write snapshot to be the default subvolume to be mounted
   at `/`.

This final step ensures that we will boot into this good snapshot, provided we
have not set the `subvol` or `subvolid` flags to point to a given subvolume in
`/etc/fstab` or as part of our `rootflags`.


### Arch notes

The [Arch Wiki](https://wiki.archlinux.org/index.php/Snapper#Suggested_filesystem_layout)
recommends having a top-level `@snapshots` subvolume, and mounting this to
`/.snapshots`.

This is problematic because `snapper create-config` will fail as it does not
expect a subvolume to be present at `/.snapshots`.
This means we have to unmount our `@snapshots` subvolume (along with destroying
`/.snapshots`), let `snapper` create the subvolume, and then mount `@snapshots`
again, which is quite cumbersome.

As such, we mimic the layout that OpenSUSE provides (described above).

### Stretch goals

 - Leverage [`pam_snapper`](http://snapper.io/manpages/pam_snapper.html) to
   automatically snapshot our home directory on every login.
 - Automatic deletion of snapshots to reduce waste.

### Further reading

 - [Btrfs and Rollback - How It Works and How to Avoid Pitfalls](https://events.static.linuxfound.org/sites/events/files/slides/Btrfs-Rollback-LinuxCon-20150907.pdf)
 - [Snapper Tutorial](http://snapper.io/tutorial.html)
