# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

include:
  - config.sys-i2pd-dvm

create-sys-i2pd:
  qvm.vm:
    - name: sys-i2pd
    - present:
      - template: sys-i2pd-dvm
      - label: yellow
      - class: DispVM
    - prefs:
      - include-in-backup: False
      - autostart: false
      - netvm: sys-firewall
      - provides-network: True
      - memory: 512
      - vcpus: 2
    - require:
      - sls: config.sys-i2pd-dvm
