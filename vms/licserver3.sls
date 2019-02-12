## VM definition for container licserver3

sfvirt:
  vms:
    licserver3:
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
          mac: 00:02:c9:4e:20:1f
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool02
      preseed: licserver3
      dist: xenial-default

