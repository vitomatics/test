## pillar file for sandbox

# network - dhcp

include:
  - homedirs

states:
  sfdump.rsync: true

autofs:
  lookup:
    browse_mode: yes
  direct:
    /sifive: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work
  home:
    '*': -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid,nobrowse netapp1-nfs1.internal.sifive.com:/homes/&
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/nettmp

