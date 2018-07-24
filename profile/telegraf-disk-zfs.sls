## Telegraf monitoring of base ZFS file systems
## Note this only monitors the ZFS file system associated with a pool, not
## sub-filesystems of the tree

{% import_yaml "site/sifive1.yml" as site %}

include:
  - profile.telegraf-host-base
  - secret.telegraf-influxdb1

{# All ZFS file systems are big so no need to check every minute #}
{% set zfs_interval = 300 %}

states:
  telegraf: true
  sftelegraf: true

telegraf:
  agent:
    input:
      exec:
        zfs:
          interval: {{ zfs_interval }}
          commands:
            - "sifive_telegraf_zpool"

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
            - 'ALL: (root) NOPASSWD: ZCMD'
