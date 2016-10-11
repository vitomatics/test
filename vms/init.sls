## VM definitions

vms:
  altair:
    disks:
      root:
        size: 80G
        vdtype: lvm
        vdvg: vm1
    type: libvirt
    vcpu: 2
    mem: 4G
    bridge: br0
    vmhost: marvin
    macs:
      eth0:
        mac: 00:16:3e:01:23:73
   
