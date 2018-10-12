## Telegraf monitoring of SLURM

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{# For now, lets try every 2 mins #}
{% set slurm_interval = 120 %}

states:
  telegraf: true
  sftelegraf: true

telegraf:
  agent:
    input:
      exec:
        slurm:
          interval: {{ slurm_interval }}
          commands:
            - "sifive_telegraf_slurm"

