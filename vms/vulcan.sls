## VM definition for host vulcan

vms:
  vulcan:
    type: libvirt
    vmhost: marvin
    vcpus: 2
    memory: 4096   # In MB
    autostart: off
    ifs:
      eth0:
        bridge: br0
        mac: 52:54:00:ff:00:04
    disks:
      root:
        vdtype: lvm
        size: 30G
        vg: vmpool02
      data:
        vdtype: lvm
        size: 40G
        vg: vmpool02
    preseed: vulcan
    os: ubuntu16.04

