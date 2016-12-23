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
