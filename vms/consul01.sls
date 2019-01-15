## VM definition for host consul01

sfvirt:
  vms:
    consul01:
      type: libvirt
      vmhost: bender.internal.sifive.com
      vcpus: 1
      memory: 2048   # In MB
      autostart: off
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:0c
      disks:
        root:
          vdtype: lvm
          size: 20G
          vg: vg_system
        data:
          vdtype: lvm
          size: 10G
          vg: vg_system
      preseed: consul01
      dist: xenial-default


