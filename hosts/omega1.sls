## Pillar file for omega1
## temporary backup server

include:
 - homedirs

states:
  zfs: true
  nfs4: true

nfs4:
  domain:
    internal.sifive.com

