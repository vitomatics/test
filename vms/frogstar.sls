## VM definition for host frogstar

sfvirt:
  vms:
    frogstar:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 16384   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:14
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
      preseed: frogstar
      dist: xenial-default
