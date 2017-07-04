## VM definition for container jarjar

sfvirt:
  vms:
    jarjar:
      type: lxc
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      subuidbase: 100000
      subgidbase: 100000
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:15
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
      preseed: jarjar
      dist: xenial-default

