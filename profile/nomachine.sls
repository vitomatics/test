## pillar file for default nomachine setup

states:
  nomachine.terminal-server: true

nomachine:
  lookup:
    tsurl: http://sfimages.internal.sifive.com/NoMachine/Terminal_Server/deb/nomachine-terminal-server-evaluation_5.2.11_2_amd64.deb
  terminal-server:
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirstualDesktopSharing: true

