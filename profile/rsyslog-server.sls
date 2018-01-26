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
          string: /srv/log/%HOSTNAME%/%programname%.log
    ruleset:
      logserver:
        description: action(type="omfile" dynaFile="RemoteFilePath")
    input:
      imudp:
        port: 10514
        ruleset: logserver
        
disksetup:
   dirs:
     /srv/log:
       user: root
       group: syslog
       mode: '0775'

    

