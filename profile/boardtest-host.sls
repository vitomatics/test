# A generic boardtest host

{% import_yaml "boardtest/sanmateo.yml" as sanmateo %}


states:
  boardtest: true
  boardtest.client: true


boardtest:
  lookup:
    datadir: /var/lib/boardtest
    confdir: /etc/boardtest
    confname: boardtest.conf
    poweruser: boardtest-pduuser

  group: compute
  udevs: {{ sanmateo.udevs|default({})|yaml }}
  pdus: {{ sanmateo.pdus|default({})|yaml }}
  testhosts: {{ sanmateo.testhosts|default({})|yaml }}


sudo:
  included:
    # Add paulw amd troyb to the sudoers file for boardtest troubleshooting
    sifive-paulw:
      userspec:
        - 'paulw':
          - ALL: '(ALL:ALL) ALL'
    sifive-troyb:
      userspec:
        - 'troyb':
          - ALL: '(ALL:ALL) ALL'
