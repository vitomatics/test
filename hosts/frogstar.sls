## pillar file for frogstar

states:
  firewall.iptables: true

# A VG for data
disksetup:
  vgs:
    frogstar00:
      disks:
        - /dev/vdb
  lvs:
    scratch:
      size: 39.9G
      vg: frogstar00
  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: frogstar00/scratch

