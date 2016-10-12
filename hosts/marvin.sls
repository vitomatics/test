## Pillar file for marvin

states:
  sfvirt: true

network:
  interfaces:
    ## Regular management interface
    eno3:
      ip: 10.14.16.33

    ## Dedicated (VLAN?) trunk interface for VMs
    eno1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: dhcp
      require: eno1
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno1
