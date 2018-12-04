## pillar file for epsilon*

states:
  firewall.iptables: true
  udev: true

# Make sure we do not try and use ethlab as our route to the outside world
network:
  gateway: 10.14.0.1

network:
  interfaces:
    ethlab:
      proto: dhcp


## The Spectre fix
pkgs:
  list:
    intel-microcode: true

# Give the external USB Ethernet dongle the name "ethtest"
udev:
  rules:
    99-sifive-ethtest:
      'USB Ethernet dongle':
        - 'ACTION=="add"'
        - 'SUBSYSTEM=="net"'
        - 'SUBSYSTEMS=="usb"'
        - 'ATTRS{removable}=="removable"'
        - 'NAME="ethtest"'
