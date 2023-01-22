#!/usr/bin/bash

sudo qubesctl top.disable sys-i2pd

rm sys-i2pd-install.sh

sudo sed -i 's/qubes.ConnectTCP +4444 @anyvm sys-i2pd allow//g' /etc/qubes/policy.d/30-user.policy
sudo sed -i 's/qubes.ConnectTCP +7657 @anyvm sys-i2pd allow//g' /etc/qubes/policy.d/30-user.policy

sudo rm /srv/salt/sys-i2pd.top
sudo rm /srv/salt/config/sys-i2pd.sls
sudo rm /srv/salt/config/sys-i2pd-template.sls
sudo rm /srv/salt/config/sys-i2pd-template-config.sls
sudo rm /srv/salt/config/sys-i2pd-dvm.sls
sudo rm /srv/salt/config/i2pd-browse-template.sls
sudo rm /srv/salt/config/i2pd-browse-template-config.sls
sudo rm /srv/salt/config/i2pd-browse-dvm.sls
sudo rm /srv/salt/config/i2pd-browse-dvm-config.sls
sudo rmdir /srv/salt/config
