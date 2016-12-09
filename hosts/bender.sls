## Pillar file for bender

# This is what the network should be if the whole thing was not buggy
# and had to be setup by hand
# network:
#   interfaces:
#     ## Regular management interface
#     eno1:
#       ip: 10.14.0.13
#     ## Dedicated (VLAN?) trunk interface for VMs
#     enp4s0:
#       type: eth
#       proto: manual
#       netmask: 
#       gateway:
#       nameservers: [ ]
#     ## Bridge for unix-net
#     br0:
#       type: bridge
#       proto: manual
#       require: enp4s0
#       netmask:
#       gateway:
#       nameservers: [ ]
#       ports:
#         - enp4s0

libvirt:
  bridges:
    - br0

# disksetup:
#   vgs:
#     vmpool02:
#       disks:
#         - /dev/sdb

