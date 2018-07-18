states:
  telegraf: true

telegraf:
  agent:
    enabled: true
    output:
      influxdb:
        db1:
          urls:
            - http://{{site.influxdb.server}}:{{ site.influxdb.port }}
          database: "network"
          timeout: {{site.influxdb.timeout}}
