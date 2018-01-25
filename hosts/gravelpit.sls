## pillar file for gravelpit

# network - dhcp

states:
  firewall.iptables: true
  sftesthost: true
  rsyslog.client: true

rsyslog:
  client:
    enabled: true
    format:
      name: TraditionalFileFormat
      template: '"%TIMESTAMP% %HOSTNAME% %syslogtag%%msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"'

## Example board definition for sftesthost
sftesthost:
  boards:
    board0:
      type: arty
      alias: arty0
      console_type: usbtty
      console_dev: /dev/ttyusb0
      manage_type: digilent
      manage_serial: 01234567
      debug_type: ftdi
      debug_serial: 01234567
    board1:
      type: vc
      subtype: vc707
      alias: vc0
      console_type: usbtty
      console_dev: auto
      debug_type: ftdi
      debug_serial: auto
    board2:
      type: hifive
      subtype: hifive1
      alias: hifive0
      console_type: usbtty
      console_dev: /dev/ttyusb0
      debug_type: ftdi
      debug_desc: auto

