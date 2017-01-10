## VM definition for host luke

vms:
  luke:
    type: libvirt
    vmhost: eddie.internal.sifive.com
    vcpus: 2
    memory: 4096   # In MB
    autostart: on
    ifs:
      eth0:
        bridge: br0
        mac: 52:54:00:ff:00:09
    disks:
      root:
        vdtype: lvm
        size: 30G
        vg: vmpool01
    preseed: luke
    os: ubuntu16.04
