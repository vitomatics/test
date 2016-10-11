## Pillar file for heartofgold
## ZFS-based backup server

pkgs:
  zfsutils-linux: true

network:
  interfaces:
    eno1:
      ip: 10.14.16.48
