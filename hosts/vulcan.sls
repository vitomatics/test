## pillar file for vulcan

states:
  firewall.iptables: true

# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.37

# A VG for data
disksetup:
  vgs:
    vulcan00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 39.9G
      vg: vulcan00
  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: vulcan00/srv



firewall:
  ports:
    tcp:
      22: 10.0.0.0/8
