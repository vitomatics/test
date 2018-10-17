# A generic boardtest host

{% import_yaml "boardtest/sanmateo.yml" as sanmateo %}


states:
  boardtest: true
  boardtest.pdu: true


boardtest:
  lookup:
    datadir: /var/lib/boardtest
    confdir: /etc/boardtest
    confname: boardtest.conf
    pduuser: pduuser

  pdus: {{ sanmateo.pdus|default({})|yaml }}
  boards: {{ sanmateo.boards|default({})|yaml }}
