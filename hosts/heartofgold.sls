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



disksetup:
  zpools:
    bkpool01:
      properties:
        ashift: '12'
      filesystem_properties:
        mountpoint: /pool/bkpool01
        atime: 'off'
        compression: 'lz4'
      layout:
        mirror-0:
          - /dev/disk/by-id/wwn-0x5000cca2543ecd38
          - /dev/disk/by-id/wwn-0x5000cca2543e7cc8
        mirror-1:
          - /dev/disk/by-id/wwn-0x5000cca2543e9a80
          - /dev/disk/by-id/wwn-0x5000cca2543f8f88
        mirror-2:
          - /dev/disk/by-id/wwn-0x5000cca2543e3110
          - /dev/disk/by-id/wwn-0x5000cca2543f9200
        mirror-3: 
          - /dev/disk/by-id/wwn-0x5000cca2543c5bbc
          - /dev/disk/by-id/wwn-0x5000cca2543e6d94
        mirror-4:
          - /dev/disk/by-id/wwn-0x5000cca25436e238
          - /dev/disk/by-id/wwn-0x5000cca254364754
        mirror-5:
          - /dev/disk/by-id/wwn-0x5000cca2543d1b3c
          - /dev/disk/by-id/wwn-0x5000cca2543dc184
        mirror-6:
          - /dev/disk/by-id/wwn-0x5000cca2543d9e60
          - /dev/disk/by-id/wwn-0x5000cca254262f18
        spare-0:
          - /dev/disk/by-id/wwn-0x5000cca2543f8f28
          - /dev/disk/by-id/wwn-0x5000cca2542fc368
        log-0:
          - mirror
          - /dev/disk/by-id/wwn-0x5000cca0491f4508
          - /dev/disk/by-id/wwn-0x5000cca0491f424c
  zfss:
    bkpool01/sfbackup:
      properties:
        mountpoint: /sfbackup
        atime: off
    bkpool01/sfbackup/work:
      properties:
        compression: lzjb
    bkpool01/sfbackup/sifive:
    

