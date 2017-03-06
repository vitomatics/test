## VM definition for host matrix

sfvirt:
  vms:
    altair:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:11
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
        data:
          vdtype: lvm
          size: 50G
          vg: vmpool01
      preseed: matrix
      dist: xenial-default
