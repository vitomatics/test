## pillar file for klingon

states:
  firewall.iptables: true
  apache: true
  autofs: true
  nfs4: true

# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.74


nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /work: -fstype=nfs4,ro,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work

firewall:
  ports:
    tcp:
      80: 10.14.0.0/16 10.17.0.0/16
      443: 10.14.0.0/16 10.17.0.0/16
