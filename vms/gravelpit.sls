## VM definition for teset host gravelpit

sfvirt:
  vms:
    gravelpit:
      type: libvirt
      vmhost: bender.internal.sifive.com
      vcpus: 1
      memory: 2048   # In MB
      autostart: off
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:0b
      disks:
        root:
          vdtype: lvm
          size: 20G
          vg: vg_system
      preseed: gravelpit
      dist: xenial-default


