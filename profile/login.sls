# Pillar config for generic login server

{# Note outside addresses are NATed #}
{% set sshclientnets = "any" %}

include:
  - profile.compute
  - profile.nomachine
  - homedirs

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
      22: {{ sshclientnets }}
    udp:
      60000:61000: {{ sshclientnets }}
