## VM definition for host gaia

sfvirt:
  vms:
    gaia:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 4
      memory: 12288   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:21
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool03
        data:
          vdtype: lvm
          size: 20G
          vg: vmpool03
      preseed: gaia
      dist: xenial-default
