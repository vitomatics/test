## pillar file for romulan

states:
  firewall.iptables: true


# A VG for data
disksetup:
  vgs:
    romulan00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 39.9G
      vg: romulan00
  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: romulan00/srv

