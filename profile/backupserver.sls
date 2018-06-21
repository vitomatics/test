## Pillar file for backup server machines

include:
  - backups.rsync
  
states:
  zfs: true
  autofs: true
  sfdump.nfs: true
  sfdump.rsync: true

## sfdump:
##   nfs:
##    fstype: 'nfs4,nfsvers=4.1'
