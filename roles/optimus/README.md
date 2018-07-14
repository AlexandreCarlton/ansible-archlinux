# Optimus

Sets up a laptop with an NVIDIA Optimus graphics card. This allows the laptop
to default to integrated graphics, using the dedicated graphics card at will.
This functionality is useful for battery-saving purposes.

This role implements this through the use of Bumblebee, mimicking Optimus
technology.

To test that this works, run this command:

```
$ optirun glxgears -info
```
