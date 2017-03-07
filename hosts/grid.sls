## pillar file for grid

# Enabled firewalling.

states:
  firewall.iptables: true

# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.75

# A VG for the srv directory
disksetup:
  vgs:
    grid00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 48G
      vg: grid00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: grid00/srv

