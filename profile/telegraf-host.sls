## The basic telegraf setup for host monitoring.

{% set influxdb_port = 8086 %}
{% set influxdb_server = 'influxdb1.internal.sifive.com' %}


states:
  telegraf: true

telegraf:
  agent:
    enabled: true
    input:
      cpu:
        allcpus:
          percpu: false
          totalcpu: true
    output:
      influxdb:
        db1:
          urls:
            - http://{{influxdb_server}}:{{ influxdb_port }}
          database: "network"
          timeout: 10s
