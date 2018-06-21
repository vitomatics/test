## Pillar file for backup server machines

include:
  - backups.rsync
  
states:
  zfs: true
  autofs: true
  sfdump.nfs: true
  sfdump.rsync: true

