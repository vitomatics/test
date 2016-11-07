# Pillar config for generic login server

{# Note outside addresses are NATed #}
{% set sshclientnets = "10.14.0.0/16 10.17.0.0/16 10.100.0.0/16 10.101.0.0/16" %}

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
