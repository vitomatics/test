## VM definition for host altair

sfvirt:
  vms:
    altair:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 12288   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:01
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool02
      preseed: altair
      dist: xenial-default
