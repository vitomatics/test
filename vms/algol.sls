## VM definition for host algol

sfvirt:
  vms:
    algol:
      type: libvirt
      vmhost: bender.internal.sifive.com
      vcpus: 2
      memory: 8192   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:05
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vg_system
      preseed: algol
      os: ubuntu16.04
