## pillar file for altair

states:
  firewall.iptables: true

# A VG for data
disksetup:
  vgs:
    altair00:
      disks:
        - /dev/vdb
  lvs:
    scratch:
      size: 39.9G
      vg: altair00
  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: altair00/scratch
