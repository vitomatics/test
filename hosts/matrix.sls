## pillar file for matrix

# Enabled firewalling.

states:
  firewall.iptables: true


# network - static - serveral services
network:
  interfaces:
    ens2:
      ip: 10.14.16.76

# A VG for the srv directory
disksetup:
  vgs:
    matrix00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 48G
      vg: matrix00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: matrix00/srv

