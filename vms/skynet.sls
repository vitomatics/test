## VM definition for host skynet

sfvirt:
  vms:
    skynet:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 8192   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:19
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
        data:
          vdtype: lvm
          size: 100G
          vg: vmpool01
      preseed: skynet
      dist: xenial-default

