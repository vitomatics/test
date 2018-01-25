## VM definition for host wall-e

sfvirt:
  vms:
    wall-e:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:18
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
        data:
          vdtype: lvm
          size: 200G
          vg: vmpool01
      preseed: wall-e
      dist: xenial-default

