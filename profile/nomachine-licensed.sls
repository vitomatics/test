## pillar file for licensed nomachine setup

states:
  nomachine.terminalserver: true
  nomachine.terminalserver.license: true

nomachine:
  terminal-server:
    server-license-pillar: site:nomachine:server-license
    node-license-pillar: site:nomachine:node-license
    
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirtualDesktopSharing: true

