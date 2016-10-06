network:
  interfaces:
    eth0:
      ip: 10.14.0.10

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
