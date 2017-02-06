## pillar file for licensed nomachine setup but using the eval package

states:
  nomachine.terminalserver: true
  nomachine.terminalserver.license: true

nomachine:
  lookup:
    eval: true
    tsurl: http://sfimages.internal.sifive.com/NoMachine/Terminal_Server/deb/nomachine-terminal-server-evaluation_5.2.11_2_amd64.deb
  terminal-server:
    server-license-pillar: site:nomachine:server-license
    node-license-pillar: site:nomachine:node-license
    
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirstualDesktopSharing: true

