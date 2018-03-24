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
          name: allcpus
      snmp:
        routers:
          agents: router11.internal.sifive.com
          version: 2
          community: HanIF2slow
          name: "snmp"
          fields:
            - oid: "1.3.6.1.2.1.1.5.0"
              name: hostname
              is_tag: true
            - oid: "1.3.6.1.2.1.25.1.1.0"
              name: uptime
          tables:
            # IF-MIB::ifXTable
            - oid: "1.3.6.1.2.1.31.1.1"
              name: interface
              inherit_tags:
                - hostname
    output:
      file:
        tmpfile1:
          files:
            - /tmp/telegraf.out
          data_format: influx
