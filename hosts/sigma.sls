## Pillar file for the sigma machines

boot:
  grub:
    serial:
      port: 1

disksetup:
  vgs:
    vg_disk2:
      disks:
        - /dev/sdb
  lvs:
    scratch:
      size: 9000G
      vg: vg_disk2

  mounts:
    /scratch:
      fstype: ext4
      opts: noatime
      lv: vg_disk2/scratch
