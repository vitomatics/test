## VM definition for host vader

sfvirt:
  vms:
    vader:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:16
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool02
      preseed: vader
      dist: xenial-default

