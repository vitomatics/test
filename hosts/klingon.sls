## pillar file for klingon

states:
  firewall.iptables: true
  apache: true
  autofs: true
  nfs4: true


nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /work: -fstype=nfs4,ro,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/work

