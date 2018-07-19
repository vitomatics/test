## Profile for a telegraf/influxdb/grafana server to monitor the system

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.influxdb-influxdb1

{% set grafana_port = 3000 %}
{% set web_port = 80 %}
{% set sysmon_dir = '/srv/monhost' %}


states:
  snmp: true
  telegraf: true
  influxdb: true
  grafana: true
  nginx: true

telegraf:
  agent:
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
                - name: ifName
                  oid: "IF-MIB::ifDescr"
                  is_tag: true
            - oid: "IF-MIB::ifXTable"
              name: interface
              inherit_tags:
                - hostname
              fields:
                - name: ifName
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
            - oid: "EATON-EPDU-MIB::inputCurrentTable"
              name: input_current
              index_as_tag: true
              inherit_tags:
                - hostname
            - oid: "EATON-EPDU-MIB::outletPowerTable"
              name: outlet_power
              index_as_tag: true
              inherit_tags:
                - hostname
              fields:
                - name: "outletName"
                  oid: "EATON-EPDU-MIB::outletName"
                  is_tag: true

influxdb:
  server:
    enabled: true
    http:
      auth-enabled: true
      enabled: true
      bind:
        port: {{ site.influxdb.port }}
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
            duration: 365d
            replication: 1
            is_default: true
    # passwords for this next section are in secret/influxdb-influxdb1.sls
    admin:
      user:
        enabled: true
        name: admin
        password: admin
    user:
      network1:
        enabled: true
        admin: false
        name: network1
      grafana1:
        enabled: true
        admin: false
        name: grafana1
    grant:
      network1_grant:
        enabled: true
        user: network1
        privilege: write
        database: network
      grafana1_grant:
        enabled: true
        user: grafana1
        privilege: all
        database: network


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
          port: {{ web_port }}
        proxy:
          host: 127.0.0.1
          port: {{ grafana_port }}
          protocol: http


firewall:
  ports:
    tcp:
      {{ web_port }}: 10.14.0.0/16 10.17.0.0/16
      {{ site.influxdb.port }}: 10.14.0.0/16

