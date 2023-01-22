#!/usr/bin/bash
read -p "Enter DispVM here: " DISPVM
sudo mkdir /srv/salt/config
export $DISPVM

sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/sys-i2pd.top' | sudo tee /srv/salt/sys-i2pd.top
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/sys-i2pd.sls' | sudo tee /srv/salt/config/sys-i2pd.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/sys-i2pd-template.sls' | sudo tee /srv/salt/config/sys-i2pd-template.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/sys-i2pd-template-config.sls' | sudo tee /srv/salt/config/sys-i2pd-template-config.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/sys-i2pd-dvm.sls' | sudo tee /srv/salt/config/sys-i2pd-dvm.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/i2pd-browse-template.sls' | sudo tee /srv/salt/config/i2pd-browse-template.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/i2pd-browse-template-config.sls' | sudo tee /srv/salt/config/i2pd-browse-template-config.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/i2pd-browse-dvm.sls' | sudo tee /srv/salt/config/i2pd-browse-dvm.sls
sudo qvm-run --pass-io $DISPVM 'cat /home/user/sys-i2pd/qubes-salt/config/i2pd-browse-dvm-config.sls' | sudo tee /srv/salt/config/i2pd-browse-dvm-config.sls

echo "qubes.ConnectTCP +4444 @anyvm sys-i2pd allow" | sudo tee -a /etc/qubes/policy.d/30-user.policy
echo "qubes.ConnectTCP +7657 @anyvm sys-i2pd allow" | sudo tee -a /etc/qubes/policy.d/30-user.policy
sudo qubesctl top.enable sys-i2pd
sudo qubesctl --show-output --targets sys-i2pd-template,sys-i2pd-dvm,sys-i2pd,i2pd-browse-template,i2pd-browse-dvm  state.highstate
qvm-shutdown --wait sys-i2pd
