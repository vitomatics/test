## Pillar file for vmhost machines

states:
  libvirt: true
  sfvirt: true

sfvirt:
  os:
    distbase: http://mirrors.kernel.org/ubuntu
    preseedbase: http://install.internal.sifive.com/preseed/ubuntu
    arch: amd64
    release: xenial

pkgs:
  list:
    virt-viewer: true
    debootstrap: true
    # Some stuff for testing X
    x11-apps: true
    xterm: true
    libgl1-mesa-glx: true

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
