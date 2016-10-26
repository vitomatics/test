## VM definition for host sandbox

vms:
  sandbox:
    type: libvirt
    vmhost: marvin
    vcpus: 1
    memory: 2048   # In MB
    autostart: off
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
    os: ubuntu16.04

