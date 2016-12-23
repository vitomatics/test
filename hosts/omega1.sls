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
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/rpms/perccli-1.11.03-1.noarch.rpm

