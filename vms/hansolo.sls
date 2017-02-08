## VM definition for host hansolo

sfvirt:
  vms:
    hansolo:
      type: libvirt
      vmhost: bender.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:07
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vg_system
      preseed: hansolo
      os: ubuntu16.04
