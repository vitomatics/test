## Telegraf monitoring of the Netapp NFS shares

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{# All ZFS file systems are big so no need to check every minute #}
{% set zfs_interval = 300 %}

states:
  telegraf: true

# Note that this only works if /home is mounted as a whole tree rather
# than individual directories, i.e. it probably only works on tardis

telegraf:
  agent:
    input:
      exec:
        zfs:
          interval: {{ zfs_interval }}
          commands:
            - "sudo sifive_telegraf_zpool"

sudo:
  included:
    sifive-telegraf-zfs:
      alias:
        commands:
          ZCMD:
            - "/sbin/zfs list"
            - "/sbin/zfs list *"
            - "/sbin/zpool list"
            - "/sbin/zpool list *"
      userspec:
        - 'telegraf':
            - ALL: (root) NOPASSWD: ZCMD
