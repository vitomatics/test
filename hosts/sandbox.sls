## pillar file for sandbox

# network - dhcp

states:
  firewall.iptables: true
  sshguard: true


# Login server testing


include:
  - profile.compute

sshd:
  options:
    X11Forwarding: yes

pkgs:
  list:
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
    mate-applets: true
    mate-system-monitor: true
    mate-themes: true
    mate-tweak: true
    mate-utils: true
    mate-dock-applet: true
    mate-indicator-applet: true
    mate-gnome-main-menu-applet: true
    gnome-shell: true
    gnome-terminal: true
    gnome-calculator: true
    # These next two needed by nedit
    xfonts-100dpi: true
    xfonts-75dpi: true
    

firewall:
  usesshguard: true
