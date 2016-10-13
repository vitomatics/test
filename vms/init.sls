## VM definitions

vms:
  altair:
    type: libvirt
    vmhost: marvin
    vcpus: 2
    memory: 4096   # In GB
    autostart: true
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
