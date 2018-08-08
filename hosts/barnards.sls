## pillar file for barnards

states:
  firewall.iptables: true

# A VG for data
disksetup:
  vgs:
    barnards00:
      disks:
        - /dev/vdb
  lvs:
    scratch:
      size: 39.9G
      vg: barnards00
  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: barnards00/scratch

