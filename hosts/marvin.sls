## Pillar file for marvin

## Dedicated VLAN trunk interface for VMs
network:
  interfaces:
    eno3:
      ip: 10.14.16.33
    eno1:
      type: eth
      bridge: br0
    br0:
      type: bridge
      require: eno1
      bridge: br0
      ports:
        - eno1
