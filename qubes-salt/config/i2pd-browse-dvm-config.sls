# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

#
# Create socket service
#
/rw/config/i2pd-service.socket:
  file.managed:
    - contents:
      - '[Unit]'
      - 'Description=i2pd-service'
      - ' '
      - '[Socket]'
      - 'ListenStream=127.0.0.1:4444'
      - 'Accept=true'
      - ' '
      - '[Install]'
      - 'WantedBy=sockets.target'

/rw/config/i2pd-service@.service:
  file.managed:
    - contents:
      - '[Unit]'
      - 'Description=i2pd-service'
      - ' '
      - '[Service]'
      - 'ExecStart=qrexec-client-vm sys-i2pd qubes.ConnectTCP+4444'
      - 'StandardInput=socket'
      - 'StandardOutput=inherit'

#
# Create console socket service
#
/rw/config/i2pd-console-service.socket:
  file.managed:
    - contents:
      - '[Unit]'
      - 'Description=i2pd-console-service'
      - ' '
      - '[Socket]'
      - 'ListenStream=127.0.0.1:7657'
      - 'Accept=true'
      - ' '
      - '[Install]'
      - 'WantedBy=sockets.target'

/rw/config/i2pd-console-service@.service:
  file.managed:
    - contents:
      - '[Unit]'
      - 'Description=i2pd-console-service'
      - ' '
      - '[Service]'
      - 'ExecStart=qrexec-client-vm sys-i2pd qubes.ConnectTCP+7657'
      - 'StandardInput=socket'
      - 'StandardOutput=inherit'

/rw/config/rc.local:
  file.append:
    - text:
      - 'cp -r /rw/config/i2pd-service.socket /rw/config/i2pd-service@.service /lib/systemd/system/'
      - 'cp -r /rw/config/i2pd-console-service.socket /rw/config/i2pd-console-service@.service /lib/systemd/system/'
      - 'systemctl daemon-reload'
      - 'systemctl start i2pd-service.socket'
      - 'systemctl start i2pd-console-service.socket'

