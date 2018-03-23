## pillar file for skynet

states:
  firewall.iptables: true
  telegraf: true

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
      lv: skynet/srv

pkgs:
  list:
    snmp: true
    

telegraf:
  agent:
    enabled: true
    interval: 60
    input:
      cpu:
        allcpus:
          name_prefix: allcpus
          interval: 10
      snmp:
        routers:
          agents:
            - router03.internal.sifive.com
          version: 2
          community: HanIF2slow
    output:
      file:
        tmpfile1:
          files:
            - /tmp/telegraf.out
          data_format: influx
        tmpfile2:
          files:
            - /tmp/telegraf2.out
          data_format: json
