## Pillar file for marvin

network:
  interfaces:
    ## Regular management interface
    ens3:
      ip: 10.14.16.33

    ## Dedicated (VLAN?) trunk interface for VMs
    ens1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    ens1.101:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
      vlan-raw-device: ens1
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: dhcp
      require: eno1.101
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - ens1.101

libvirt:
  bridges:
    - br0

disksetup:
  vgs:
    vmpool02:
      disks:
        - /dev/sdb
  
