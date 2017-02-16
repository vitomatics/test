## Pillar file for heartofgold
## ZFS-based backup server

boot:
  grub:
    serial:

states:
  zfs: true
  nfs4: true


# Initial disk setup
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

zfs:
  # heartofgold has 64GB - keep a quarter of it free for non-ZFS stuff
  zfs_arc_max: {{ 48*1024*1024*1024 }}
  filesystems:
    bkpool01/sfbackup:
      properties:
        mountpoint: /sfbackup
        atime: off
    bkpool01/sfbackup/dumps:
    bkpool01/sfbackup/logs:
    bkpool01/sfbackup/dumps/homes:
    bkpool01/sfbackup/dumps/work:
    bkpool01/sfbackup/dumps/sifive:
    bkpool01/sfbackup/dumps/vulcan-srv:
    bkpool01/sfbackup/dumps/nihilanth-etc:
    bkpool01/sfbackup/dumps/gonarch-srv:
    bkpool01/sfbackup/dumps/breencast-ldap-db:
    bkpool01/sfbackup/dumps/breencast-ldap-config:
    bkpool01/sfbackup/dumps/dalek-srv:
    bkpool01/sfbackup/dumps/i0-license:

nfs4:
  domain:
    internal.sifive.com

sfdump:
  lookup:
    logdir: /sfbackup/logs
    days: 8
    weeks: 12
  logttl: 14
  jobs:
    default:
      absent: false
      starttime: '19:00'
  nfs:
    homes:
      client: netapp1-nfs1.internal.sifive.com
      export: /homes
      dest: /sfbackup/dumps/homes
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 2h
    work:
      client: netapp1-nfs1.internal.sifive.com
      export: /work
      dest: /sfbackup/dumps/work
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 4h
    sifive:
      client: netapp1-nfs1.internal.sifive.com
      export: /sifive
      dest: /sfbackup/dumps/sifive
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 5h
