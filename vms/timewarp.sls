## VM definition for host timewarp

sfvirt:
  vms:
    timewarp:
      type: libvirt
      dist: xenial-default
      preseed: timewarp
      vmhost: chappie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: off
      vnc: off
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:20
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool04
