## Pillar file for vmhost machines

states:
  libvirt: true
  sfvirt: true

kmods:
  list:
    8021q: true

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'


