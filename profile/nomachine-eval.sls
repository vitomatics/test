## pillar file for evaluation nomachine setup

states:
  nomachine.terminalserver: true

nomachine:
  terminal-server:
    eval: true
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirtualDesktopSharing: true

