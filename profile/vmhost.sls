## Pillar file for vmhost machines

states:
  libvirt: true
  sfvirt: true

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'


