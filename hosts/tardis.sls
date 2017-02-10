## pillar file for tardis

include:
  - homedirs

states:
  firewall.iptables: true
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
    /work: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com/work
  maps:
    nettmp:
      mountpoint: /nettmp
      map:
        netapp1a: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/nettmp

pam:
  access:
    compute: ALL
    rxia: ALL
    han: ALL
    yunsup: ALL

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
    - rxia:
      - ALL: '(ALL:ALL) ALL'
    - han:
      - ALL: '(ALL:ALL) ALL'
    - yunsup:
      - ALL: '(ALL:ALL) ALL'
  

homedirs:
  lookup:
    home: /home
  servers:
    {{grains.id}}: true
    
