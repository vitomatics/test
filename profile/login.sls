# Pillar config for generic login server


include:
  - profile.compute
  - site.sshguard-whitelist

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pkgs:
  list:
    mosh: true
    xubuntu-desktop: true
    xfce4-terminal: true
    xfce4-screenshooter: true
    xfce4-taskmanager: true
    ristretto: true
    pastebinit: true
    mousepad: true
    ubuntu-desktop: true
    lxde: true
    lxsession: true
    lxterminal: true
    mate-core: true
    gnome-shell: true
    gnome-terminal: true
    gnome-calculator: true
    
states:
  firewall.iptables: true
  sshguard: true

firewall:
  usesshguard: true
  ports:
    tcp:
      22: any
    udp:
      60000:61000: any
