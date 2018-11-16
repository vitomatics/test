# A generic boardtest host

{% import_yaml "boardtest/sanmateo.yml" as sanmateo %}


states:
  boardtest: true


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
