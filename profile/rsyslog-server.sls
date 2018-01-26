## Profile for an rsyslog server

states:
  rsyslog.server: true

rsyslog:
  server:
    enabled: true

disksetup:
   dirs:
     /srv/log:
       user: root
       group: syslog
       mode: '0775'


