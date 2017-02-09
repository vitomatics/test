## VM definition for host viki

sfvirt:
  vms:
    viki:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:0d
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool01
      preseed: viki
      dist: xenial-default
