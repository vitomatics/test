## Pillar file for bender

network:
  interfaces:
    ## Regular management interface
    eno1:
      ip: 10.14.0.13

    ## Dedicated (VLAN?) trunk interface for VMs
    eno2:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: manual
      require: eno2
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno2

libvirt:
  bridges:
    - br0

# disksetup:
#   vgs:
#     vmpool02:
#       disks:
#         - /dev/sdb

