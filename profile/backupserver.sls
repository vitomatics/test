## Pillar file for backup server machines

include:
  - backups
  
states:
  zfs: true
  autofs: true
  sfdump.nfs: true
  sfdump.rsync: true
