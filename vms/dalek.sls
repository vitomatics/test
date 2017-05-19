## VM definition for host dalek

sfvirt:
  vms:
    dalek:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:02
      disks:
        root:
          vdtype: lvm
          size: 30G
          vg: vmpool02
        data:
          vdtype: lvm
          size: 200G
          vg: vmpool02
      preseed: dalek
      dist: xenial-default

