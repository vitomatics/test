## pillar file for skynet

states:
  firewall.iptables: true

# network - static - several services
network:
  interfaces:
    ens2:
      ip: 10.14.16.47


# A VG for the srv directory
disksetup:
  vgs:
    skynet00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 90G
      vg: skynet00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: skynet00/srv
  dirs:
    /srv/monhost:
      user: telegraf
      group: root
      mode: '0755'



