## Pillar file for eddie

network:
  interfaces:
    ## Regular management interface
    eno3:
      ip: 10.14.16.32
    ## Dedicated (VLAN?) trunk interface for VMs
    eno1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    eno1.101:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
      vlan-raw-device: eno1
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: manual
      require: eno1.101
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno1.101

disksetup:
  vgs:
    vmpool01:
      disks:
        - /dev/sdb
