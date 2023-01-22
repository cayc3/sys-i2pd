# sys-i2pd
QT GUI for i2pd + i2pd pre-configured browser for Qubes OS

![](https://github.com/cayc3/sys-i2pd/blob/main/mask.ico)

-------------

### Intro

- Create an easily configurable disposable ProxyVM for i2p traffic with a dockable GUI Interface
- Made for Qubes 4.1
- i2pd pre-configured browser included for ease-of-use 
- TODO Populate Wiki with notes
- TODO Autostart minimized
- TODO Option to restart i2pd-QT application after configuration changes

-------------

### Installation for Qubes 4.1

##### In dispXXX Qube:

```sh
git clone https://github.com/cayc3/sys-i2pd
```

##### In dom0:

Install Script

```sh
sudo qvm-run --pass-io dispXXX 'cat /home/user/sys-i2pd/install.sh' | tee -a sys-i2pd-install.sh >& /dev/null; chmod +x sys-i2pd-install.sh; sudo ./sys-i2pd-install.sh
```

Uninstall Script

```sh
sudo qvm-run --pass-io dispXXX 'cat /home/user/sys-i2pd/uninstall.sh' | tee -a sys-i2pd-uninstall.sh >& /dev/null; chmod +x sys-i2pd-uninstall.sh; sudo ./sys-i2pd-uninstall.sh; rm sys-i2pd-uninstall.sh
```

-------------

Project is free for personal use, donations are welcome.

Project is NOT free for use in commercial settings. Donation equivalent to 2
weeks of gross coffee costs is required in order to fulfill licensing terms. ; D

BTC: bc1q3ssxvtcve8pwf2ge7rn2a2flrxrpz5xjtg9lyp

-------------

Greetz & thanks to the following projects.

Tooling:  
https://github.com/PurpleI2P/i2pd-qt  
https://github.com/eyedeekay/i2p.plugins.firefox  

Inspiration:  
https://github.com/control-owl/suriGUI  

