## pillar file for gravelpit

# network - dhcp

states:
  firewall.iptables: true
  sftesthost: true

## Example board definition for sftesthost
sftesthost:
  boards:
    board0:
      # Allowed types: arty, vc, hifive
      type: arty
      alias: arty0
      # allowed console_type: usbtty
      console_type: usbtty
      console_dev: /dev/ttyusb0
      # Allowed manage_type: digilient
      manage_type: digilent
      manage_serial: 01234567
      # allowed debug_type: ftdi
      debug_type: ftdi
      debug_serial: 01234567
    board1:
      type: vc
      subtype: vc707
      alias: vc0
      console_type: usbtty
      console_dev: auto
      debug_type: ftdi
      # ~ means auto-detect
      debug_serial: ~
    board2:
      type: hifive
      subtype: hifive1
      alias: hifive0
      console_type: ttyusb
      console_dev: /dev/ttyusb0
      debug_type: ftdi
      debug_desc: ~

