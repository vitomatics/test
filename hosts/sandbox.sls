## pillar file for sandbox

# network - dhcp

include:
  - homedirs

states:
  sfdump.rsync: true

autofs:
  direct:
    /sifive: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work
  home:
    * -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/homes/&

