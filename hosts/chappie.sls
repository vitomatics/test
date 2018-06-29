## Pillar file for chappie

states:
  perccli: true
  
perccli:
  lookup:
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/deb/perccli_1.11.03-2_all.deb

boot:
  grub:
    serial:
      port: 1

network:
  interfaces:
    ## Regular management interface
    eno3:
      ip: 10.14.17.33

    ## Dedicated (VLAN?) trunk interface for VMs
    eno1:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    eno1.111:
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
      require: eno1.111
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno1.111

libvirt:
  bridges:
    - br0

disksetup:
  vgs:
    vmpool04:
      disks:
        - /dev/sdb
  
