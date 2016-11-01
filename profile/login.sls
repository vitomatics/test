# Pillar config for generic login server

include:
  - profile.compute

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes


pkgs:
  list:
    sshguard: true
    mosh: true
    xubuntu-desktop: true
    nomachine-terminal-sever: true
