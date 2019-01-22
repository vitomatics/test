## Pillar file for omega1
## temporary backup server

{% import_yaml "site/sifive1.yml" as site %}

states:
  zfs: true
  nfs4: true
  perccli: true

nfs4:
  domain: {{ site.nfs4.domain }}

perccli:
  lookup:
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/deb/perccli_1.11.03-2_all.deb

disksetup:
  ## WARNING - /dev/sd* and crypt-sd* do not match!!!
  cryptdevs:
    crypt-sdb:
      disk: /dev/sdc
    crypt-sdc:
      disk: /dev/sdd
    crypt-sdd:
      disk: /dev/sde
    crypt-sde:
      disk: /dev/sdf
    crypt-sdf:
      disk: /dev/sdg
    crypt-sdg:
      disk: /dev/sdh
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
        mirror-1:
          - /dev/mapper/crypt-sdd
          - /dev/mapper/crypt-sde
        mirror-2:
          - /dev/mapper/crypt-sdf
          - /dev/mapper/crypt-sdg

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
    bkpool02/sfbackup/dumps/dalek-srv:
    bkpool02/sfbackup/dumps/yoda-srv:
    bkpool02/sfbackup/dumps/vader-srv:


sfdump:
  lookup:
    logdir: /sfbackup/logs
    days: 8
    weeks: 12
  defaultjob: omega1
  logttl: 14
  jobs:
    omega1:
      starttime: '00:30'
  nfs:
    homes:
      client: netapp1-nfs1.internal.sifive.com
      export: /homes
      dest: /sfbackup/dumps/homes
      fstype: nfs4,nfsvers=4.1
      snaptype: netapp_daily
      acls: false
      xattrs: false
      bwlimit: 12000
      timeout: 6h
    sifive:
      client: netapp1-nfs1.internal.sifive.com
      export: /sifive
      dest: /sfbackup/dumps/sifive
      fstype: nfs4,nfsvers=4.1
      snaptype: netapp_daily
      acls: false
      xattrs: false
      timeout: 9h
      bwlimit: 13000
      absent: false
    work:
      client: netapp1-nfs2.internal.sifive.com
      export: /work
      dest: /sfbackup/dumps/work
      fstype: nfs4,nfsvers=4.1
      snaptype: netapp_daily
      acls: false
      xattrs: false
      bwlimit: 16000
      timeout: 12h
