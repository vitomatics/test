## VM definitions

vms:
  altair:
    preseed: altair
    disks:
      root:
        size: 30G
        vdtype: lvm
        vdvg: vm1
      data:
        size: 20G
        vdvg: vm1
        vdtype: lvm
    type: libvirt
    vcpus: 2
    memory: 4096   # In GB
    bridge: br0
    vmhost: marvin
    macs:
      eth0:
        mac: 00:16:3e:01:23:73
        bridge: br0
        
   
