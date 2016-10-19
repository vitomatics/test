## VM definition for host dalek

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

