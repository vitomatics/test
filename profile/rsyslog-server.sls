## Profile for an rsyslog server

states:
  rsyslog.server: true
  logrotate: true

rsyslog:
  server:
    enabled: true
    module:
      imudp: {}
    template:
      RemoteFilePath:
        parameter:
          type: string
          string: "/srv/log/%programname:::lowercase%/%programname:::lowercase%.log"
    ruleset:
      logserver:
        description: |
          if (prifilt("auth.*") or prifilt("authpriv.*")) then {
              action(type="omfile" file="/srv/log/auth/auth.log")
              stop
          }
          if (prifilt("*.warning")) then {
              action(type="omfile" file="/srv/log/syslog/syslog.log")
              stop
          }
          if (prifilt("local4.*")) then {
              action(type="omfile" file="/srv/log/netapp/netapp.log")
              stop
          }
          if (prifilt("local5.*")) then {
              action(type="omfile" file="/srv/log/pdu/pdu.log")
              stop
          }
          if (prifilt("local7.*")) then {
              action(type="omfile" file="/srv/log/net/net.log")
              stop
          }
    input:
      imudp:
        port: 514
        ruleset: logserver

logrotate:
  logs:
    sifive-remote:
      files: /srv/log/auth/auth.log /srv/log/syslog/syslog.log /srv/log/net/net.log /srv/log/boardtest/pdu.log /srv/log/netapp/netapp.log
      missingok: true
      period: daily
      rotate: 30
      dateext: true
      dateyesterday: true
      postrotate: invoke-rc.d rsyslog rotate >/dev/null 2>/dev/null
      
        
disksetup:
   dirs:
     /srv/log:
       user: root
       group: syslog
       mode: '0775'

firewall:
  ports:
    udp:
      514: 10.14.0.0/16 10.15.0.0/16 10.100.0.0/16 10.101.0.0/16 10.134.0.0/16
