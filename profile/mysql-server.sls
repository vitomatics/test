## Basic MySQL database server


states:
  mysql: true


mysql:
  server:
    host: localhost
    root_user: root
    root_password: asdf1234
    mysqld:
      datadir: /srv/mysql
      
