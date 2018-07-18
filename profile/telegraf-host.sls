## The basic telegraf setup for host monitoring.

{% import_yaml "site/sifive1.yml" as site %}

states:
  telegraf: true

telegraf:
  agent:
    enabled: true
    input:
      cpu:
        totcpu:
          interval: 60
          percpu: false
          totalcpu: true
          report_active: true
      disk:
        alldisks:
          ignore_fs:
            - cgroup
            - fusectl
            - sysfs
            - proc
            - devpts
            - devtmpfs
            - securityfs
            - pstore
      system:
        localhost:
      processes:
        localhost:
      swap:
        localhost:
      mem:
        localhost:
    output:
      influxdb:
        db1:
          urls:
            - http://{{site.influxdb.server}}:{{ site.influxdb.port }}
          database: "network"
          timeout: {{site.influxdb.timeout}}
