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
    bkpool02/sfbackup/logs:
    bkpool02/sfbackup/dumps:
    bkpool02/sfbackup/dumps/work:
    bkpool02/sfbackup/dumps/homes:
    bkpool02/sfbackup/dumps/sifive:
    bkpool02/sfbackup/dumps/vulcan-srv:


sfdump:
  lookup:
    logdir: /sfbackup/logs
  defaultjob: omega1
  logttl: 14
  jobs:
    omega1:
      starttime: 05:00
    sifive-setup:
      disabled: true
  nfs:
    work:
      client: netapp1-nfs1.internal.sifive.com
      export: /work
      dest: /sfbackup/dumps/work
      bwlimit: 10000
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 2h
    homes:
      client: netapp1-nfs1.internal.sifive.com
      export: /homes
      dest: /sfbackup/dumps/homes
      bwlimit: 10000
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 100h
      job: sifive-setup
{#
    sifive:
      client: netapp1-nfs1.internal.sifive.com
      export: /sifive
      dest: /sfbackup/dumps/sifive
      bwlimit: 10000
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 100h
      job: sifive-setup
#}
{#
    homes:
      client: netapp1-nfs1.internal.sifive.com
      export: /homes
      dest: /sfbackup/dumps/homes
      bwlimit: 10000
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 2h
    sifive:
      client: netapp1-nfs1.internal.sifive.com
      export: /sifive
      dest: /sfbackup/dumps/sifive
      bwlimit: 10000
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 5h
#}
