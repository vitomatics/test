## pillar file for default GoCD server setup

states:
  gocd.server: true

gocd:
  lookup:
    serverurl: http://sfimages.internal.sifive.com/ThoughtWorks/GoCD/deb/go-server_16.11.0-4185_all.deb


{#
firewall:
  ports:
    tcp:
      8153: 10.0.0.0/8
      8154: 10.0.0.0/8
#}
