## The basic telegraf setup for server monitoring.

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{% set default_interval = 60 %}


states:
  telegraf: true

telegraf:
  agent:
    enabled: true
    input:
      cpu:
        totcpu:
          interval: {{ default_interval }}
          percpu: false
          totalcpu: true
          report_active: true
      disk:
        alldisks:
          interval: {{ default_interval }}
          ignore_fs:
            - cgroup
            - fusectl
            - sysfs
            - proc
            - devpts
            - devtmpfs
            - securityfs
            - pstore
            - tmpfs
            - nfs
            - nfs4
      system:
        localhost:
          interval: {{ default_interval }}
      processes:
        localhost:
          interval: {{ default_interval }}
      swap:
        localhost:
          interval: {{ default_interval }}
      mem:
        localhost:
          interval: {{ default_interval }}
    output:
      influxdb:
        db1:
          urls:
            - http://{{site.influxdb.server}}:{{ site.influxdb.port }}
          database: "network"
          timeout: {{site.influxdb.timeout}}
