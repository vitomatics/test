## pillar file for evaluation nomachine setup

states:
  nomachine.terminalserver: true

nomachine:
  lookup:
    tsurl: http://sfimages.internal.sifive.com/NoMachine/Terminal_Server/deb/nomachine-terminal-server-evaluation_5.2.11_2_amd64.deb
  terminal-server:
    eval: true
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirstualDesktopSharing: true

