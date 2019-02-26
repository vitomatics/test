## VM definition for host login4

sfvirt:
  vms:
    login4:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 2
      memory: 24576   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:1g
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool01
        data:
          vdtype: lvm
          size: 40G
          vg: vmpool01
      preseed: login4
      dist: xenial-default
