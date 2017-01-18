## Pillar file for backup client machines

include:
  - backups.rsync

states:
  sfdump.slave: true

# sfdump needs access - note the ssh config ties the address down
# to just the backup server
pam:
  access:
    sfdump: ALL


