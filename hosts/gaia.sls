## pillar file for gaia

# Enabled firewalling.

states:
  firewall.iptables: true

# A VG for the srv directory
disksetup:
  vgs:
    gaia00:
      disks:
        - /dev/vdb
  lvs:
    scratch:
      size: 19.8G
      vg: gaia00
  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: gaia00/srv

