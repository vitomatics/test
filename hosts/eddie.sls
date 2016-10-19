## Pillar file for eddie

network:
  interfaces:
    eno3:
      ip: 10.14.16.32

disksetup:
  vgs: vmpool01:
    disks:
      - /dev/sdb
