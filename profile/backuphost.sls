## Pillar file for backuphost machines

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
