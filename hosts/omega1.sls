## Pillar file for omega1
## temporary backup server

states:
  zfs: true
  nfs4: true
  perccli: true

nfs4:
  domain:
    internal.sifive.com

perccli:
  lookup:
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/deb/perccli_1.11.03-2_all.deb

disksetup:
  cryptdevs:
    crypt-sdb:
      disk: /dev/sdb
    crypt-sdc:
      disk: /dev/sdc
  zpools:
    bkpool02:
      properties:
        ashift: '12'
      filesystem_properties:
        mountpoint: /pool/bkpool02
        atime: 'off'
        compression: 'lz4'
      layout:
        mirror-0:
          - /dev/mapper/crypt-sdb
          - /dev/mapper/crypt-sdc

zfs:
  # omega1 has 128GB - keep half of it free for non-ZFS stuff
  zfs_arc_max: {{ 64*1024*1024*1024 }}
  filesystems:
    bkpool02/sfbackup:
      properties:
        mountpoint: /sfbackup
        atime: off
    bkpool01/sfbackup/logs:
    bkpool01/sfbackup/dumps:
    bkpool01/sfbackup/dumps/work:

