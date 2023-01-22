# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31

#
# i2pd-QT Dependencies
#
i2pd-install-dependencies:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-networking
      - qubes-core-agent-passwordless-root
      - build-essential
      - git
      - qt5ct
      - qtbase5-dev
      - libboost-all-dev
      - libminiupnpc-dev
      - libssl-dev
      - zlib1g-dev

#
# i2pd-QT
#
i2pd_qt-git:
  cmd.run:
    - name: 'export https_proxy=127.0.0.1:8082 && git clone --recursive https://github.com/PurpleI2P/i2pd-qt /tmp/i2pd_qt'

i2pd_qt-install:
  cmd.run:
    - name: 'cd /tmp/i2pd_qt && qmake && make && make install'

/var/lib/i2pd/i2pd.conf:
  file.managed:
    - makedirs: True
    - contents:
      - 'tunconf=/var/lib/i2pd/tunnels.conf'
      - ' '
      - 'log=syslog'
      - ' '
      - 'loglevel=None'
      - ' '
      - 'logclftime=false'
      - ' '
      - 'host=0.0.0.0'
      - ' '
      - 'port=0'
      - ' '
      - 'daemon=false'
      - ' '
      - 'service=false'
      - ' '
      - 'nat=true'
      - ' '
      - 'ipv4=true'
      - ' '
      - 'ipv6=false'
      - ' '
      - 'notransit=false'
      - ' '
      - 'floodfill=false'
      - ' '
      - 'share=100'
      - ' '
      - 'netid=2'
      - ' '
      - 'ssu=false'
      - ' '
      - 'reservedrange=true'
      - ' '
      - '[http]'
      - 'enabled=true'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=7657'
      - ' '
      - 'auth=false'
      - ' '
      - 'user=i2pd'
      - ' '
      - 'strictheaders=true'
      - ' '
      - 'hostname=localhost'
      - ' '
      - '[httpproxy]'
      - 'enabled=true'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=4444'
      - ' '
      - 'addresshelper=true'
      - ' '
      - 'keys=transient-proxy'
      - ' '
      - 'signaturetype=7'
      - ' '
      - 'inbound.length=3'
      - ' '
      - 'inbound.quantity=5'
      - ' '
      - 'outbound.length=3'
      - ' '
      - 'outbound.quantity=5'
      - ' '
      - 'i2cp.leaseSetType=3'
      - ' '
      - 'i2cp.leaseSetEncType=0,4'
      - ' '
      - '[socksproxy]'
      - 'enabled=true'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=4447'
      - ' '
      - 'keys=transient-proxy'
      - ' '
      - 'signaturetype=7'
      - ' '
      - 'inbound.length=3'
      - ' '
      - 'inbound.quantity=5'
      - ' '
      - 'outbound.length=3'
      - ' '
      - 'outbound.quantity=5'
      - ' '
      - 'outproxy.enabled=false'
      - ' '
      - 'outproxy=127.0.0.1'
      - ' '
      - 'outproxyport=9050'
      - ' '
      - 'i2cp.leaseSetType=3'
      - ' '
      - 'i2cp.leaseSetEncType=0,4'
      - ' '
      - '[sam]'
      - 'enabled=true'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=7656'
      - ' '
      - 'singlethread=true'
      - ' '
      - '[bob]'
      - 'enabled=false'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=2827'
      - ' '
      - '[i2cp]'
      - 'enabled=false'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=7654'
      - ' '
      - '[i2pcontrol]'
      - 'enabled=false'
      - ' '
      - 'address=127.0.0.1'
      - ' '
      - 'port=7650'
      - ' '
      - 'password=itoopie'
      - ' '
      - 'cert=i2pcontrol.crt.pem'
      - ' '
      - 'key=i2pcontrol.key.pem'
      - ' '
      - '[upnp]'
      - 'enabled=false'
      - ' '
      - 'name=I2Pd'
      - ' '
      - '[precomputation]'
      - 'elgamal=false'
      - ' '
      - '[reseed]'
      - 'verify=false'
      - ' '
      - 'urls=https://reseed2.i2p.net/,https://reseed.diva.exchange/,https://reseed-fr.i2pd.xyz/,https://reseed.memcpy.io/,https://reseed.onion.im/,https://i2pseed.creativecowpat.net:8443/,https://reseed.i2pgit.org/,https://i2p.novg.net/,https://banana.incognet.io/,https://reseed-pl.i2pd.xyz/,https://www2.mk16.de/'
      - ' '
      - 'threshold=25'
      - ' '
      - '[addressbook]'
      - 'defaulturl=http://shx5vqsw7usdaunyzr2qmes2fq37oumybpudrd4jjj4e4vk4uusa.b32.i2p/hosts.txt'
      - ' '
      - 'subscriptions=http://reg.i2p/hosts.txt'
      - ' '
      - '[limits]'
      - 'transittunnels=5000'
      - ' '
      - 'openfiles=0'
      - ' '
      - 'coresize=0'
      - ' '
      - '[trust]'
      - 'enabled=false'
      - ' '
      - 'hidden=false'
      - ' '
      - '[websockets]'
      - 'enabled=false'
      - ' '
      - 'port=0'
      - ' '
      - '[exploratory]'
      - 'inbound.length=2'
      - ' '
      - 'inbound.quantity=3'
      - ' '
      - 'outbound.length=2'
      - ' '
      - 'outbound.quantity=3'
      - ' '
      - '[ntcp2]'
      - 'enabled=true'
      - ' '
      - 'published=true'
      - ' '
      - 'port=0'
      - ' '
      - 'addressv6=::'
      - ' '
      - '[ssu2]'
      - 'enabled=true'
      - ' '
      - 'published=true'
      - ' '
      - 'port=0'
      - ' '
      - '[nettime]'
      - 'enabled=false'
      - ' '
      - 'ntpservers=0.pool.ntp.org,1.pool.ntp.org,2.pool.ntp.org,3.pool.ntp.org'
      - ' '
      - 'ntpsyncinterval=72'
      - ' '
      - '[persist]'
      - 'profiles=true'

/var/lib/i2pd:
  cmd.run:
    - name: 'touch /var/lib/i2pd/tunnels.conf && chown -R user:user /var/lib/i2pd'

#
# i2pd-QT autostart
#
/etc/xdg/autostart/i2pd-qt.desktop:
  file.managed:
    - makedirs: True
    - contents:
      - '[Desktop Entry]'
      - Type=Application
      - Name=i2pd-QT
      - Comment=i2pd with Qt based GUI
      - NoDisplay=false
      - Exec=/usr/bin/i2pd_qt --conf /var/lib/i2pd/i2pd.conf --tunconf /var/lib/i2pd/tunnels.conf
      - NotShowIn=GNOME;KDE;XFCE

#
# Remove Dependencies
#
i2pd-remove-dependencies:
  pkg.removed:
    - pkgs:
      - qubes-core-agent-passwordless-root
      - build-essential
      - git

#
# Apt upgrade & autoremove
#
i2pd-apt-autoremove:
  cmd.run:
    - name: 'apt upgrade -y && apt autoremove -y'

