## pillar file for wall-e

states:
  firewall.iptables: true

# network - static - several services
network:
  interfaces:
    ens2:
      ip: 10.14.16.46

# A VG for the srv directory
disksetup:
  vgs:
    walle00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 180G
      vg: walle00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: walle00/srv


