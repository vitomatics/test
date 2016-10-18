## VM definitions

vms:
  altair:
    type: libvirt
    vmhost: marvin
    vcpus: 2
    memory: 4096   # In GB
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
    os: ubuntu16.04

vms:
  dalek:
    type: libvirt
    vmhost: marvin
    vcpus: 2
    memory: 4096   # In GB
    autostart: off
    ifs:
      eth0:
        bridge: br0
        mac: 52:54:00:ff:00:02
    disks:
      root:
        vdtype: lvm
        size: 200G
        vg: vmpool02
    preseed: dalek
    os: ubuntu16.04

