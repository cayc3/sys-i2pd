# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

qvm-template-installed-sys-i2pd:
    qvm.template_installed:
        - name: debian-11-minimal

create-sys-i2pd-template:
  qvm.clone:
    - name: sys-i2pd-template
    - source: debian-11-minimal
    - label: black
