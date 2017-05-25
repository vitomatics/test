states:
  dom0:
    - xen.dom0

xen:
  bridge: xenbr0
  domu:
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
