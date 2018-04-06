## pillar file for skynet

{% set influxdb_port = 8086 %}

states:
  firewall.iptables: true
  snmp: true
  telegraf: true
  influxdb: true
  grafana: true
  nginx: true

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
    /srv/monhost/test:
      user: telegraf
      group: root
      mode: '0755'



telegraf:
  agent:
    enabled: true
    interval: 60
    input:
      snmp:
        routers:
          agents:
            - router11.internal.sifive.com
            - router12.internal.sifive.com
          version: 3
          sec_name: sfnoc
          auth_protocol: MD5
          auth_password: HanIF2slow
          sec_level: authNoPriv
          name: "netdev"
          # Note that JunOS has a limit set of MIBs that are supported
          # hence the selection of the fields below.
          fields:
            - oid: "SNMPv2-MIB::sysName.0"
              name: hostname
              is_tag: true
            - oid: "HOST-RESOURCES-MIB::hrSystemUptime.0"
              name: uptime
          tables:
            - oid: "IF-MIB::ifXTable"
              name: interface
              inherit_tags:
                - hostname
              fields:
                - name: ifDescr
                  oid: "IF-MIB::ifDescr"
                  is_tag: true
    output:
      file:
        tmpfile1:
          files:
            - /srv/monhost/test/telegraf.out
          data_format: influx
      influxdb:
        db1:
          urls:
            - http://127.0.0.1:{{ influxdb_port }}
          database: "network"
          timeout: 10s

influxdb:
  server:
    enabled: true
    http:
      enabled: true
      bind:
        address: 127.0.0.1
        port: {{ influxdb_port }}
    data:
      dir: '/srv/monhost/influxdb/data'
    meta:
      dir: '/srv/monhost/influxdb/meta'
    database:
      network:
        enabled: true
        name: network
        retention_policy:
        - name: netdata
          duration: 30d
          replication: 1
          is_default: true


grafana:
  server:
    enabled: true
    bind:
      address: 127.0.0.1
      port: 3000
    admin:
      user: admin
      password: 300DoorNotLocked
    database:
      engine: sqlite3

nginx:
  server:
    enabled: true
    site:
      grafana_proxy:
        enabled: true
        type: nginx_proxy
        name: sysmon
        host:
          name: sysmon.internal.sifive.com
          port: 80
        location:
          /sysmon/:
            host: 127.0.0.1
            port: 3000
            protocol: http

firewall:
  ports:
    tcp:
      80: 10.14.0.0/16 10.17.0.0/16

