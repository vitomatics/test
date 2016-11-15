## pillar file for dalek

states:
  apache: true
  firewall.iptables: true

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


firewall:
  ports:
    tcp:
      22: 10.0.0.0/8
      80: 10.0.0.0/8
      443: 10.0.0.0/8
    udp:
      69: 10.0.0.0/8
