## VM definitions

vms:
  altair:
    type: libvirt
    vmhost: marvin
    vcpus: 2
    ifs:
      eth0:
        bridge: br0
        mac: 00:16:3e:01:23:73
    disks:
      root:
        vdtype: lvm
        size: 30G
        vg: vmpool02
      data:
        vdtype: lvm
        size: 20G
        vg: vmpool02
        lv: altair_data1
    preseed: altair
    os: xenial
   
vm2:
    memory: 4096   # In GB
