# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
#
# coder: b0b
# stamp: 1999-12-31


#
# librewolf Dependencies
#
librewolf-install-dependencies:
  pkg.installed:
    - pkgs:
      - qubes-core-agent-networking
      - qubes-core-agent-passwordless-root
      - curl
      - gpg

#
# Add repo key
#
add-repo-key-librewolf:
  cmd.run:
    - name: 'export https_proxy=127.0.0.1:8082 && curl -fsSL "https://deb.librewolf.net/keyring.gpg" | gpg --dearmor -o /usr/share/keyrings/librewolf.gpg'

#
# Add librewolf repo
#
/etc/apt/sources.list.d/librewolf.list:
  file.managed:
    - makedirs: True
    - contents:
      - 'deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] https://deb.librewolf.net bullseye main'

# Install librewolf
install-librewolf:
  pkg.installed:
    - refresh: True
    - pkgs:
      - librewolf
      - unzip
      - python3-pip

#
# Install lastversion
#
install-lastversion:
  pip.installed:
    - name: lastversion
    - proxy: http://127.0.0.1:8082

#
# Install idk i2p profile (strict)
#
install-i2p-profile-strict:
  cmd.run:
    - name: 'cd /tmp && export https_proxy=127.0.0.1:8082 && lastversion --assets --filter firefox.base --output /tmp/base_profile.zip download "https://github.com/eyedeekay/i2p.plugins.firefox" && unzip /tmp/base_profile.zip -d /usr/share/ && chown -R user:user /usr/share/i2p.firefox.base.profile'

#
# Install idk i2p profile (usability)
#
install-i2p-profile-usability:
  cmd.run:
    - name: 'cd /tmp && export https_proxy=127.0.0.1:8082 && lastversion --assets --filter firefox.usability --output /tmp/usability_profile.zip download "https://github.com/eyedeekay/i2p.plugins.firefox" && unzip /tmp/usability_profile.zip -d /usr/share/ && chown -R user:user /usr/share/i2p.firefox.usability.profile'

#
# Install strict launcher
#
/usr/share/applications/i2p-strict-browser.desktop:
  file.managed: 
    - contents:
      - '[Desktop Entry]'
      - 'Name=i2p Browser (Strict)'
      - 'Comment=idk profile - strict'
      - 'Exec=/usr/share/librewolf/librewolf --profile /usr/share/i2p.firefox.base.profile'
      - 'Icon=librewolf'
      - 'Type=Application'
      - 'Categories=Web'

#
# Install usability launcher
#
/usr/share/applications/i2p-usability-browser.desktop:
  file.managed:
    - contents:
      - '[Desktop Entry]'
      - 'Name=i2p Browser (Usability)'
      - 'Comment=idk profile - usability'
      - 'Exec=/usr/share/librewolf/librewolf --profile /usr/share/i2p.firefox.usability.profile'
      - 'Icon=librewolf'
      - 'Type=Application'
      - 'Categories=Web'

#
# Weird ImageMagick cleanup
#
imagemagick-cleanup:
  cmd.run:
    - name: 'rm /usr/share/applications/display-im6.q16.desktop'

#
# Apt upgrade & autoremove
#
i2pd-apt-autoremove:
  cmd.run:
    - name: 'apt upgrade -y && apt autoremove -y'

