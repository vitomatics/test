## VM definition for host transporter

sfvirt:
  vms:
    transporter:
      type: libvirt
      vmhost: marvin.internal.sifive.com
      vcpus: 2
      memory: 4096   # In MB
      autostart: on
      ifs:
        eth0:
          bridge: br0
          mac: 52:54:00:ff:00:12
      disks:
        root:
          vdtype: lvm
          size: 40G
          vg: vmpool02
      preseed: transporter
      dist: xenial-default
