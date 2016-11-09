# Pillar config for generic login server


include:
  - profile.compute
{#  - profile.nomachine #}
  - site.sshguard-whitelist
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
  sshguard: true

firewall:
  usesshguard: true
  ports:
    tcp:
      22: any
    udp:
      60000:61000: any
