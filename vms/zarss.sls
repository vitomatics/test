## VM definition for host zarss

sfvirt:
  vms:
    zarss:
      type: libvirt
      vmhost: colin.internal.sifive.com
      vcpus: 2
      memory: 8192   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:1a
      disks:
        root:
          vdtype: lvm
          size: 60G
          vg: vmpool03
      preseed: zarss
      dist: xenial-default

