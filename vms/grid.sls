## VM definition for host grid

sfvirt:
  vms:
    grid:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 4
      memory: 12288   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:10
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool02
        data:
          vdtype: lvm
          size: 50G
          vg: vmpool02
      preseed: grid
      dist: xenial-default
