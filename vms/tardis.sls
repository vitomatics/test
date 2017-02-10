## VM definition for host tardis

sfvirt:
  vms:
    tardis:
      type: libvirt
      vmhost: eddie.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:0e
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool01
      preseed: tardis
      dist: xenial-default
