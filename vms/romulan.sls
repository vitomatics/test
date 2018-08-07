## VM definition for host romulan

sfvirt:
  vms:
    vulcan:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:1b
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool03
        data:
          vdtype: lvm
          size: 40G
          vg: vmpool03
      preseed: romulan
      dist: xenial-default

