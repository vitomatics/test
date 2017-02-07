## Pillar file for vmhost machines

states:
  libvirt: true
  sfvirt: true

pkgs:
  list:
    virt-viewer: true
    # Some stuff for testing X
    x11-apps: true
    xterm: true

sshd:
  options:
    X11Forwarding: yes


kmods:
  list:
    8021q: true

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'


