## pillar file for terminus

# Enabled firewalling.

states:
  firewall.iptables: true

# A VG for the srv directory
disksetup:
  vgs:
    terminus00:
      disks:
        - /dev/vdb
  lvs:
    scratch:
      size: 19.8G
      vg: terminus00
  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: terminus00/srv

o
