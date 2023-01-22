# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

include:
  - config.sys-i2pd-template

create-sys-i2pd-dvm:
  qvm.vm:
    - name: sys-i2pd-dvm
    - present:
      - template: sys-i2pd-template
      - label: red
    - prefs:
      - include-in-backup: True
      - template_for_dispvms: true
      - default_dispvm: sys-i2pd-dvm
      - netvm: sys-firewall
      - provides-network: True
      - memory: 512
      - vcpus: 2
    - require:
      - sls: config.sys-i2pd-template
