## Pillar file for colin

states:
  perccli: true
  
perccli:
  lookup:
    pkgurl: http://sfimages.internal.sifive.com/Dell/PERC/deb/perccli_1.11.03-2_all.deb

boot:
  grub:
    serial:
      port: 0

network:
  interfaces:
    ## Regular management interface
    eno3:
      ip: 10.14.17.32

    ## Dedicated (VLAN?) trunk interface for VMs
    eno2:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
    eno2.111:
      type: eth
      proto: manual
      netmask: 
      gateway:
      nameservers: [ ]
      vlan-raw-device: eno2
    ## Bridge for unix-net
    br0:
      type: bridge
      proto: manual
      require: eno2.111
      netmask:
      gateway:
      nameservers: [ ]
      ports:
        - eno2.111

libvirt:
  bridges:
    - br0

disksetup:
  vgs:
    vmpool03:
      disks:
        - /dev/sdb
  
