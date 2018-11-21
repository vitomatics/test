network:
  interfaces:
    eth0:
      ip: 10.14.1.6

boot:
  grub:
    serial:
      port: 1

udev:
  rules:
    99-mellanox:
      'Mellanox MT26448':
        - 'ACTION=="add"'
        - 'SUBSYSTEM=="net"'
        - 'ATTR{address}=="00:02:c9:4e:1b:1e"'
        - 'NAME="eth0"'
