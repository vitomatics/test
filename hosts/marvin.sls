## Pillar file for marvin

## Dedicated VLAN trunk interface for VMs
network:
  interfaces:
    eno3:
      ip: 10.14.16.33

    eno1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    br0:
      type: bridge
      proto: manual
      require: eno1
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno1
