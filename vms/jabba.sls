## VM definition for container jabba

sfvirt:
  vms:
    jabba:
      type: lxc
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:17
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
      preseed: jabba
      dist: xenial-default

