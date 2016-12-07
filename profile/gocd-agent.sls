## pillar file for default GoCD agent setup

states:
  gocd.agent: true

gocd:
  agent:
    lookup:
      pkgurl: http://sfimages.internal.sifive.com/ThoughtWorks/GoCD/deb/go-agent_16.11.0-4185_all.deb
