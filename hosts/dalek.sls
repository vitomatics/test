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
      size: 200G
      vg:dalek00

  mounts:
    /srv:
      fstype: ext4
      opts:
      lv: srv

