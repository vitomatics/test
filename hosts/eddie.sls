## Pillar file for eddie

network:
  interfaces:
    ens3:
      ip: 10.14.16.32

disksetup:
  vgs:
    vmpool01:
      disks:
        - /dev/sdb
