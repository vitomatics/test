## Basic MySQL database server

include:
  - secret.mysql-root


states:
  mysql: true


apparmor:
  usr.sbin.mysqld:
    - '/srv/mysql/ r,'
    - '/srv/mysql/** rwk,'
    - '@{PROC}/[0-9]*/status r,'
    - '/sys/devices/system/node/ r,'
    - '/sys/devices/system/node/** rw,'

policyrc:
  mysql: false

mysql:
  version: 5.7
  server:
    host: localhost
    mysqld:
      datadir: /srv/mysql
      

file:
  mkdir:
    /srv/mysql:
      user: mysql
      group: mysql
      mode: '0700'
