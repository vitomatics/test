## Pillar file for marvin

## Dedicated VLAN trunk interface for VMs
network:
  interfaces:
    eno3:
      ip: 10.14.16.33
    eno1:
      type: eth
      bridge: br0
      proto: none
      netmask: 
      gateway:
      nameservers: [ ]
    br0:
      type: bridge
      proto: none
      require: eno1
      # bridge: br0
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno1
