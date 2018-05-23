## Profile for a telegraf/influxdb/grafana server to monitor the system

{% set influxdb_port = 8086 %}
{% set grafana_port = 3000 %}
{% set sysmon_dir = '/srv/monhost' %}


states:
  snmp: true
  telegraf: true
  influxdb: true
  grafana: true
  nginx: true

telegraf:
  agent:
    enabled: true
    input:
      snmp:
        routers:
          interval: 120
          agents:
            - router01.internal.sifive.com
            - router03.internal.sifive.com
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
            - oid: "JUNIPER-MIB::jnxBoxDescr.0"
              name: BoxDescr
            - oid: "JUNIPER-MIB::jnxBoxSerialNo.0"
              name: BoxSerialNo
          tables:
            - oid: "IF-MIB::ifTable"
              name: interface
              inherit_tags:
                - hostname
              fields:
                - name: ifDescr
                  oid: "IF-MIB::ifDescr"
                  is_tag: true
            - oid: "IF-MIB::ifXTable"
              name: interface
              inherit_tags:
                - hostname
              fields:
                - name: ifDescr
                  oid: "IF-MIB::ifName"
                  is_tag: true
            - oid: "JUNIPER-MIB::jnxOperatingTable"
              name: "netdev"
              inherit_tags:
                - hostname
              fields:
                - name: "partDescr"
                  oid: "JUNIPER-MIB::jnxOperatingDescr"
                  is_tag: true
        pdus:
          interval: 120
          agents:
            - pdu11.internal.sifive.com
            - pdu21.internal.sifive.com
          version: 3
          sec_name: sfnoc
          auth_protocol: MD5
          auth_password: HanIF2slow
          sec_level: authNoPriv
          name: "pdu"
          # Note that JunOS has a limit set of MIBs that are supported
          # hence the selection of the fields below.
          fields:
            - oid: "SNMPv2-MIB::sysName.0"
              name: hostname
              is_tag: true
          tables:
            - oid: "EATON-EPDU-MIB::inputTotalPowerTable"
              name: input_power
              inherit_tags:
                - hostname
            - oid: "EATON-EPDU-MIB::outletPowerTable"
              name: outlet_power
              index_as_tag: true
              inherit_tags:
                - hostname
              # fields:
              #   - name: outletName
              #     oid: "EATON-EPDU-MIB::outletName.0"
              #     is_tag: true
    output:
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
      dir: '{{sysmon_dir}}/influxdb/data'
    meta:
      dir: '{{sysmon_dir}}/influxdb/meta'
    database:
      network:
        enabled: true
        name: network
        retention_policy:
        - name: netdata
          duration: 90d
          replication: 1
          is_default: true


grafana:
  server:
    enabled: true
#    domain: sysmon.internal.sifive.com
#    root_url: 'http://sysmon.internal.sifive.com/grafana'
    bind:
      address: 127.0.0.1
      port: {{ grafana_port }}
    admin:
      user: admin
      password: admin
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
        proxy:
          host: 127.0.0.1
          port: {{ grafana_port }}
          protocol: http


firewall:
  ports:
    tcp:
      80: 10.14.0.0/16 10.17.0.0/16

