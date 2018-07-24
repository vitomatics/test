## Telegraf monitoring of the Netapp NFS shares

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{% set default_interval = 60 %}

states:
  telegraf: true

# Note that this only works if /home is mounted as a whole tree rather
# than individual directories, i.e. it probably only works on tardis

telegraf:
  agent:
    input:
      disk:
        netapps:
          interval: {{ default_interval }}
          mount_points:
            - /sifive
            - /work
            - /home
            - /nettmp/netapp1a
