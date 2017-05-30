## pillar file for vulcan

states:
  firewall.iptables: true


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

