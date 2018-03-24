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
    interval: 10
    input:
      cpu:
        allcpus:
          name_prefix: allcpus-
      snmp:
        routers:
          agents: 10.15.224.192
          version: 2
          community: HanIF2slow
          name: "snmp"
          fields:
            - oid: "1.3.6.1.2.1.25.1.1.0"
              name: uptime
    output:
      file:
        tmpfile1:
          files:
            - /tmp/telegraf.out
          data_format: influx
