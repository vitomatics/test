## Profile for an rsyslog server

states:
  rsyslog.server: true

rsyslog:
  server:
    enabled: true
    module:
      imudp: {}
    template:
      RemoteFilePath:
        parameter:
          type: string
          string: /srv/log/%programname%.log
    ruleset:
      logserver:
        description: action(type="omfile" dynaFile="RemoteFilePath")
    input:
      imudp:
        port: 514
        ruleset: logserver
        
disksetup:
   dirs:
     /srv/log:
       user: root
       group: syslog
       mode: '0775'

firewall:
  ports:
    udp:
      154: 10.14.0.0/16 10.15.0.0/16 10.100.0.0/16 10.101.0.0/16 10.134.0.0/16
