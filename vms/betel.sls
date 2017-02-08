## VM definition for host betel

sfvirt:
  vms:
    betel:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:06
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool01
      preseed: betel
      os: ubuntu16.04
