## Pillar file for marvin

network:
  interfaces:
    ## Regular management interface
    em3:
      ip: 10.14.16.33

    ## Dedicated (VLAN?) trunk interface for VMs
    em1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    em1.101:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
      vlan-raw-device: em1
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: dhcp
      require: eno1.101
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - em1.101

libvirt:
  bridges:
    - br0

disksetup:
  vgs:
    vmpool02:
      disks:
        - /dev/sdb
  
