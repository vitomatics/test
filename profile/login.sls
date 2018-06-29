# Pillar config for generic login server


include:
  - site.sshguard-whitelist

states:
  firewall.iptables: true
  sshguard: true
  rngd: true


sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pkgs:
  list:
    mosh: true
    
firewall:
  usesshguard: true
  ports:
    tcp:
      22: any
    udp:
      60000:61000: any
