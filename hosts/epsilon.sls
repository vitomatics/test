## pillar file for epsilon*

states:
  firewall.iptables: true
  udev: true

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
