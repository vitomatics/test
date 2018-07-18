## The basic telegraf setup for compute host monitoring.

{% import_yaml "site/sifive1.yml" as site %}

include:
  - secret.telegraf-influxdb1

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
