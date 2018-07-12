## pillar file for gravelpit

{% import_yaml "accounts/allgroups.yml" as allgroups %}

# network - dhcp

states:
  firewall.iptables: true
  sftesthost: true

## Some test disksetup stuff

disksetup:
  vgs:
    gravelpit00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 9G
      vg: gravelpit00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: gravelpit00/srv

  dirs:
    /srv/mysql:




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

