## pillar file for tardis

include:
  - accounts/cluster-accounts

states:
  autofs: true
  nfs4: true

nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /home: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/homes
    /sifive: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/sifive
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/nettmp

pam:
  access:
    nfsroot: ALL
    sysadmin: ALL

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%nfsroot':
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
  

sfaccount:
  lookup:
    home: /home
  servers:
    {{grains.id}}: true
    
