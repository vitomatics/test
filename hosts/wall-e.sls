## pillar file for wall-e

states:
  firewall.iptables: true

# network - static - several services
network:
  interfaces:
    ens2:
      ip: 10.14.16.46/24
    'ens2:0'
      ip: 10.14.16.240/24

rsyslog:
  client:
    output:
      remote:
        gravelpit:
          enabled: true
          filter: "*.*"
          action: "@loghost.internal.sifive.com"

# A VG for the srv directory
disksetup:
  vgs:
    walle00:
      disks:
        - /dev/vdb
  lvs:
    srv:
      size: 180G
      vg: walle00

  mounts:
    /srv:
      fstype: ext4
      opts: noatime
      lv: walle00/srv


