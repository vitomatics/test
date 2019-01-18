## VM definition for host consul02

sfvirt:
  vms:
    consul02:
      type: libvirt
      vmhost: bender.internal.sifive.com
      vcpus: 1
      memory: 2048   # In MB
      autostart: off
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:0d
      disks:
        root:
          vdtype: lvm
          size: 20G
          vg: vg_system
        data:
          vdtype: lvm
          size: 10G
          vg: vg_system
      preseed: consul02
      dist: xenial-default


