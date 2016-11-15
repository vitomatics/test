## pillar file for dalek

# Apache
states:
  apache: true

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


states:
  firewall.iptables: true

firewall:
  ports:
    tcp:
      80: 10.0.0.0/8           # HTTP
      443: 10.0.0.0/8          # HTTPS
    udp:
      69: 10.0.0.0/8           # TFTP
