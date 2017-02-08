## VM definition for host sandbox

sfvirt:
  vms:
    sandbox:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 1
      memory: 2048   # In MB
      autostart: off
      vnc: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:03
      disks:
        root:
          vdtype: lvm
          size: 20G
          vg: vmpool02
      preseed: sandbox
      dist: xenial-default
