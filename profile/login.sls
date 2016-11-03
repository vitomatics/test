# Pillar config for generic login server

include:
  - profile.compute
  - profile.nomachine

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pkgs:
  list:
    mosh: true
    xubuntu-desktop: true
    ubuntu-desktop: true
    gnome-shell: true

states:
  firewall.iptables: true
  
firewall:
  sshguard: true
  ports:
    tcp:
      22: any
    udp:
      60000:61001: any
