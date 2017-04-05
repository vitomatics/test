## VM definition for host yoda

sfvirt:
  vms:
    yoda:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:13
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool02
      preseed: yoda
      dist: xenial-default

