## pillar file for dalek

states:
  apache: true
  firewall.iptables: true
  autofs: true
  nfs4: true

# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.35

# A VG for the srv directory
disksetup:
  vgs:
    dalek00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 100G
      vg: dalek00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: dalek00/srv


nfs4:
  domain: internal.sifive.com

autofs:
  lookup:
    browse_mode: yes
  direct:
    /mnt/homes: -fstype=nfs4,rw,hard,intr,acl,noatime,nodev,nosuid netapp1-nfs1.internal.sifive.com:/homes


firewall:
  ports:
    tcp:
      80: 10.0.0.0/8
      443: 10.0.0.0/8
