# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

include:
  - config.i2pd-browse-template

create-i2pd-browse-dvm:
  qvm.vm:
    - name: i2pd-browse-dvm
    - present:
      - template: i2pd-browse-template
      - label: yellow
    - prefs:
      - include-in-backup: True
      - template_for_dispvms: True
      - default_dispvm: i2pd-browse-dvm
      - netvm: sys-i2pd
      - memory: 2048
      - vcpus: 2
    - require:
      - sls: config.i2pd-browse-template
