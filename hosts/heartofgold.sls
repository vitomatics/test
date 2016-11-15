## Pillar file for heartofgold
## ZFS-based backup server

boot:
  grub:
    serial:

states:
  zfs: true

network:
  interfaces:
    eno1:
      ip: 10.14.16.48
