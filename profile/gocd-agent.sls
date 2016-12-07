## pillar file for default GoCD agent setup

{% set sslport = 8154 %}

states:
  gocd.agent: true

gocd:
  lookup:
    agent:
      pkgurl: http://sfimages.internal.sifive.com/ThoughtWorks/GoCD/deb/go-agent_16.11.0-4185_all.deb
  agent:
    server: gocd.internal.sifive.com
    sslport: {{ sslport }}
