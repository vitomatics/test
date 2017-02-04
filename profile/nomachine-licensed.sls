## pillar file for licensed nomachine setup

states:
  nomachine.terminal-server: true

nomachine:
  lookup:
    tsurl: http://sfimages.internal.sifive.com/NoMachine/Terminal_Server/deb/nomachine-5.2.11_1_amd64.deb
  terminal-server:
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirstualDesktopSharing: true

