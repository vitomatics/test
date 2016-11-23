## Pillar file for backuphost machines

{% if grains.os_family == 'Debian' %}
pkgs:
  list:
    nfs-common: true
{% endif %}

sudo:
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'
