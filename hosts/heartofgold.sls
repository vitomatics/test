network:
  interfaces:
    eth0:
      ip: 10.14.0.10

pam:
  access:
    rxia: 'ALL'
    jenkins: 'LOCAL'

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
    - rxia:
      - ALL: '(ALL:ALL) ALL'
