## Pillar file for backuphost machines

{% if grains.osfamily == 'Debian' %}
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
