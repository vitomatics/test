#!yaml|gpg
##
## Key data for influxdb database db1
##

influxdb:
  server:
    admin:
      user:
        enabled: true
        name: admin
        password: admin
    user:
      network1:
        enabled: true
        admin: false
        name: network1
        password: asdfasdf
      grafana1:
        enabled: true
        admin: false
        name: grafana1
        password: asdf1234
    grant:
      network1_grant:
        enabled: true
        user: network1
        privilege: write
        database: network
      grafana1_grant:
        enabled: true
        user: grafana1
        privilege: all
        database: network



