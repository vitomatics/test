## pillar file for magrathea

states:
  firewall.iptables: true


# A VG for the srv directory
disksetup:
  vgs:
    magrathea00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 40G
      vg: magrathea00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: magrathea00/srv





