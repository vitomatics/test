## pillar file for default GoCD server setup

{% set port = 8153 %}
{% set sslport = 8154 %}

states:
  gocd.server: true

gocd:
  lookup:
    serverurl: http://sfimages.internal.sifive.com/ThoughtWorks/GoCD/deb/go-server_16.11.0-4185_all.deb
    workdir: /srv/go-server
  port: {{ port }}
  sslport: {{ sslport }}


## firewall:
##  ports:
##    tcp:
##       {{ port }}: 10.0.0.0/8
##       {{ sslport }}: 10.0.0.0/8

