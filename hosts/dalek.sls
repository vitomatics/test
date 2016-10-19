## pillar file for dalek

# network - static - serveral services

network:
  interfaces:
    ens2:
      ip: 10.14.16.35

disksetup:
  vgs:
    dalek00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 100G
      vg: dalek00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: dalek00/srv

