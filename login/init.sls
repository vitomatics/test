# Pillar config for generic login server

include:
  - compute

sshd:
  options:
    PasswordAuthentication: no


pkgs:
  list:
    sshguard: true
    mosh: true
