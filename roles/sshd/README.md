# sshd

Sets up the host with an sshd server, enabling X11 forwarding.

Note that the default option for `X11DisplayOffset` is `10`, so we must set
`DISPLAY=:10` when running applications on the remote server.
