## Basic MySQL database server


states:
  mysql: true


apparmor:
  usr.sbin.mysqld:
    - '/srv/mysql/ r,'
    - '/srv/mysql/** rwk,'
  
mysql:
  server:
    host: localhost
    root_user: root
    root_password: asdf1234
    mysqld:
      datadir: /srv/mysql
      

file:
  mkdir:
    /srv/mysql:
      user: mysql
      group: mysql
      mode: '0700'
