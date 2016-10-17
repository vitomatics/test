## Pillar file for vmhost machines

states:
  libvirt: true

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'


libvirt:
  bridges:
    - br1
