## VM definitions

vms:
  altair:
    preseed: altair
    disks:
      root:
        vdtype: lvm
        size: 30G
        vg: vmpool02
      data:
        vdtype: lvm
        size: 20G
        vg: vmpool02
    type: libvirt
    vcpus: 2
    memory: 4096   # In GB
    vmhost: marvin
    macs:
      eth0:
        mac: 00:16:3e:01:23:73
        bridge: br0
        
   
