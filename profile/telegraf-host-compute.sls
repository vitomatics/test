## The basic telegraf setup for compute host monitoring.

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{% set default_interval = 60 %}

states:
  telegraf: true

telegraf:
  agent:
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
            - zfs
        tmp:
          interval: {{ default_interval }}
          mount_points:
            - /tmp
      diskio:
        localhost:
          interval: {{ default_interval }}
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
      net:
        localhost:
          interval: {{ default_interval }}
          
