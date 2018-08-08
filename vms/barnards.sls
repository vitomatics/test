## VM definition for host barnards

sfvirt:
  vms:
    barnards:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 2
      memory: 24576   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:1c
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool03
        data:
          vdtype: lvm
          size: 40G
          vg: vmpool03
      preseed: barnards
      dist: xenial-default

