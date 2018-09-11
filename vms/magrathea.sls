## VM definition for host magrathea

sfvirt:
  vms:
    magrathea:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 4
      memory: 16384   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:1f
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool03
        data:
          vdtype: lvm
          size: 50G
          vg: vmpool03
      preseed: magrathea
      os: ubuntu16.04
      dist: xenial-default
