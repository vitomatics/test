states:
  dom0:
    - xen.dom0

xen:
  bridge: xenbr0
  domu:
    borderworld:
      mem: 2048
      vcpu: 2
      disk: /dev/vg_combine/domu-borderworld
      mac: '00:16:3e:69:77:0b'
      pci:
        - '05:00.0'
    citadel:
      mem: 16384
      disk: /dev/vg_combine/domu-citadel
      mac: '00:16:3e:5c:50:48'
    nihilanth:
      vcpu: 2
      disk: /dev/vg_combine/domu-nihilanth
      mac: '00:16:3e:0a:74:64'
    breencast:
      disk: /dev/vg_combine/domu-breencast
      mac: '00:16:3e:e1:83:aa'
    metrocop:
      disk: /dev/vg_combine/domu-metrocop
      mac: '00:16:3e:3e:c0:0c'
    synth:
      mem: 8192
      vcpu: 4
      disk: /dev/vg_combine/domu-synth
      mac: '00:16:3e:88:55:b7'
    gonarch:
      disk: /dev/vg_combine/domu-gonarch
      mac: '00:16:3e:95:9b:ee'
