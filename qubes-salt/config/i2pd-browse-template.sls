# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

qvm-template-installed-i2pd-browse:
  qvm.template_installed:
    - name: debian-11-minimal

create-i2pd-browse-template:
  qvm.clone:
    - name: i2pd-browse-template
    - source: debian-11-minimal
    - label: black

